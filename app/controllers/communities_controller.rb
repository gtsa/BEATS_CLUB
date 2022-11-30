class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
    @posts = Post.where(community_id: @community.id)
    @profiles = JoinCommunity.where(community_id: @community.id)
    raise
    profiles = profiles.map do |profile|
      Profile.find(id: profile)
    end
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
