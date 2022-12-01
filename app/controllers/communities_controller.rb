class CommunitiesController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @communities = Community.all
    user_communities = JoinCommunity.where(profile_id: current_user.profiles.first.id)
    @community_created_joined = @communities.map do |community|
      [
        community,
        current_user.id == community.profile_id,
        user_communities.map(&:community_id).include?(community.id)
      ]
    end
  end

  def show
    @community = Community.find(params[:id])
    posts = @community.posts
    profiles = posts.map { |post| Profile.find(post.profile_id) }
    likes = posts.map { |post| Like.where(post_id: post.id) }
    @posts_profiles_likes = posts.zip(profiles, likes)
    profile_ids = JoinCommunity.where(community_id: @community.id).pluck(:profile_id)
    @profiles = profile_ids.map do |profile_id|
      Profile.find(profile_id)
    end
    @posts_likes = @community.posts.map do |post|
      Like.find_by(post_id: post.id)
    end
    @post = Post.new(community: @community)
    @user_check = current_user.id == @community.profile_id
    # @creator_check = current_user.id == @community.profile_id
    user_communities = JoinCommunity.where(profile_id: current_user.profiles.first.id)
    @this_community = user_communities.where(community_id: @community.id).first
    @joined = user_communities.map(&:community_id).include? @community.id
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
    params.require(:community).permit(:name, :description, :location)
  end
end
