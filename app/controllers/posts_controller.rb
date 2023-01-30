class PostsController < ApplicationController
  def create
    @community = Community.find(params[:community_id])
    @post = Post.new(post_params)
    @post.community = @community
    @post.profile_id = current_user.profiles.last.id
    respond_to do |format|
      if @post.save!
        format.html { redirect_to community_path(@community) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render 'communities/show', status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
    @community = Community.find(params[:community_id])
  end

  def update
    @community = Community.find(params[:community_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to community_path(@community)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def like
    @post = Post.find(params[:community_id].split('/').last)
    @community = Community.find(params[:id])
    likes = Like.where(profile_id: current_user.profiles.last.id).where(post_id: @post.id)
    return unless likes.length.zero?

    Like.create(
      profile_id: current_user.profiles.last.id,
      post_id: @post.id
    )
    redirect_to(community_path(@community))
  end

  def unlike
    @post = Post.find(params[:community_id].split('/').first)
    @community = Community.find(params[:id])
    likes = Like.where(profile_id: current_user.profiles.last.id).where(post_id: @post.id)
    return if likes.length.zero?

    like = likes.first
    like.destroy
    redirect_to(community_path(@community))
  end

  private

  def post_params
    params.require(:post).permit(:content, :title, :photo)
  end
end
