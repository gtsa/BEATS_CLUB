class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    profile_communities_ids = JoinCommunity.where(profile: @profile).pluck(:community_id)
    @profile_communities = profile_communities_ids.map { |commun_id| Community.find(commun_id) }
    profile_genres_ids = JoinGenre.where(profile: @profile).pluck(:genre_id)
    @profile_genres = profile_genres_ids.map { |commun_id| Genre.find(commun_id) }
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save!

      redirect_to myprofile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio, :location, :nickname)
  end
end
