class GenresController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    all_genres = Genre.all
    user_genres = Genre.where(id: JoinGenre.where(profile_id: Profile.find_by(user_id: current_user.id).id).pluck(:genre_id))
    genres = all_genres - user_genres
    genres = genres.sort_by { |elem| -JoinGenre.where(genre_id: elem.id).length }
    @genres = user_genres + genres
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
