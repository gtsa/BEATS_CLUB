class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    profile_ids = JoinGenre.where(genre_id: @genre.id).pluck(:profile_id)
    @genre_profiles = profile_ids.map { |profile_id| Profile.find(profile_id) }
    @genre_communities = Community.where(genre: @genre)
    user_genres = JoinGenre.where(profile_id: current_user.profiles.first.id)
    @joined = user_genres.map(&:genre_id).include? @genre.id
  end
end
