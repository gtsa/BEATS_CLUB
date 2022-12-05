class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @communities = Community.all.to_a
    if user_signed_in?
      user_communities_ids = JoinCommunity.where(profile_id: current_user.profiles.first.id).pluck(:community_id).to_a
      user_communities = user_communities_ids.map { |elem| Community.find(elem) }
      @communities -= user_communities
      @communities = @communities.map do |commmunity|
        [commmunity, JoinCommunity.where(community_id: commmunity).length]
      end
      @communities = @communities.sort_by { |com| -com[1] }
      @communities = @communities.map(&:first)
      @communities.unshift(*user_communities)
    end
    @communities = Community.where("name ILIKE?", "%#{params[:query]}%") if params[:query].present?
  end

  def show
    @community = Community.find(params[:id])
    posts = @community.posts
    post_profiles = posts.map { |post| Profile.find(post.profile_id) }
    likes = posts.map { |post| Like.where(post_id: post.id) }
    @posts_profiles_likes = posts.zip(post_profiles, likes)
    profile_ids = JoinCommunity.where(community_id: @community.id).pluck(:profile_id)
    @profiles = profile_ids.map { |profile_id| Profile.find(profile_id) }
    actual_profile = Profile.find(@community.profile_id)
    @profiles.delete(actual_profile)
    @profiles = @profiles.sort_by(&:nickname)
    @profiles.unshift(actual_profile)
    if user_signed_in?
      @user_check = current_user.id == @community.profile_id
      user_communities = JoinCommunity.where(profile_id: current_user.profiles.first.id)
      # @this_community = user_communities.where(community_id: @community.id).first
      @joined = user_communities.map(&:community_id).include? @community.id
    end
    @post = Post.new(community: @community)
    @communities_show = user_signed_in? && @joined
  end

  def new
    @community = Community.new(params[:id])
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      JoinCommunity.create(community_id: @communit.id, profile_id: current_user)
      redirect_to communities_path(@community)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    @community = Community.find(params[:id])
    if @community.update(community_params)
      redirect_to community_path(@community)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def community_params
    params.require(:community).permit(:name, :description, :location, :photo)
  end
end
