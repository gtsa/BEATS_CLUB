class JoinCommunitiesController < ApplicationController
  def create
    @community = Community.find(params[:community_id])
    @join_community = JoinCommunity.new
    @join_community.community_id = @community.id
    @join_community.profile_id = current_user.id
    if @join_community.save
      redirect_to community_path(@community)
    else
      render 'communities/show', status: :unprocessable_entity
    end
  end

  def destroy
    @community = Community.find(params[:community_id])
    @profile = Profile.find(params[:id])
    @join_community = JoinCommunity.where(community_id: @community.id)
                                   .where(profile_id: @profile.id)
                                   .first
    @join_community.destroy
    redirect_to community_path(@community)
  end

  def join_community_params
    params.require(:join_community).permit
  end
end
