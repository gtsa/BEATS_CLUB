class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
    @posts = Post.where(community_id: @community.id)
    profile_ids = JoinCommunity.where(community_id: @community.id).pluck(:profile_id)
    @profiles = profile_ids.map do |profile_id|
      Profile.find(profile_id)
    end
    @post = Post.new(community: @community)
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

  private

  def community_params
    params.require(:community).permit(:name, :description, :location)
  end
end
