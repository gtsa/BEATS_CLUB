class PostsController < ApplicationController
  # skip_before_action :authenticate_user!

  def create
    @post = Post.new(posts_params)
    @community = Community.find(params[:community_id])
    @post.community = @community
    @post.profile_id = current_user.profiles.first.id
    @post.likes = 0
    if @post.save!
      redirect_to community_path(@community)
    else
      render 'communities/show', status: :unprocessable_entity
    end
  end

  def like
    @post = Post.find(params[:id])
    @community = Community.find(params[:community_id])
    Like.create(
      profile_id: current_user.id,
      post_id: @post.id
    )
    redirect_to(community_path(@community))
  end

  def unlike
    @post = Post.find(params[:id])
    @community = Community.find(params[:community_id])
    like = Like.where(profile_id: current_user.id).where(post_id: @post.id).first
    like.destroy
    redirect_to(community_path(@community))
  end

  private

  def posts_params
    params.require(:post).permit(:content)
  end
end
