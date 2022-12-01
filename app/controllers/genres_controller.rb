class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    genre_profiles_ids = JoinGenre.where(genre: @genre).pluck(:profile_id)
    @genre_profiles = genre_profiles_ids.map { |profile_id| Profile.find(profile_id) }
    @genre_communities = Community.where(genre: @genre)
  end
end
