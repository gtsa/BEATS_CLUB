class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @community = Community.find(params[:community_id])
    @post.community = @communitu
    if @review.save
      redirect_to list_path(@list)
    else
      bookmarks = Bookmark.where(list_id: @list.id)
      movies = bookmarks.map do |bookmark|
        Movie.find(bookmark.movie_id)
      end
      @bookmarks_movies = bookmarks.zip(movies)
      @reviews = Review.where(list_id: @list.id)
      render 'lists/show', status: :unprocessable_entity
    end
  end
end
