class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    profile_communities_ids = JoinCommunity.where(profile: @profile).pluck(:community_id)
    @profile_communities = profile_communities_ids.map { |commun_id| Community.find(commun_id) }
    profile_genres_ids = JoinGenre.where(profile: @profile).pluck(:genre_id)
    @profile_genres = profile_genres_ids.map { |commun_id| Genre.find(commun_id) }
    @user_check = current_user == @profile.user
  end

  def new
    @disable_bottom = true
    @disable_nav = true
    @alt_nav = true
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save!
      redirect_to communities_path, notice: "#{@profile.last_name}! Welcome to Beats Club!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @disable_bottom = true
    @disable_nav = true
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to myprofile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio, :location, :nickname, :photo)
  end
end
