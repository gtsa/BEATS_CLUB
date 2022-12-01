class JoinGenresController < ApplicationController
  def create
    @genre = Genre.find(params[:genre_id])
    @join_genre = JoinGenre.new
    @join_genre.genre_id = @genre.id
    @join_genre.profile_id = current_user.id
    if @join_genre.save
      redirect_to genre_path(@genre)
    else
      render 'genres/show', status: :unprocessable_entity
    end
  end

  def destroy
    @genre = Genre.find(params[:genre_id])
    @profile = Profile.find(params[:id])
    @join_genre = JoinGenre.where(genre_id: @genre.id).where(profile_id: @profile.id).first
    @join_genre.destroy
    redirect_to genre_path(@genre)
  end

  def join_genre_params
    params.require(:join_genre).permit
  end
end
