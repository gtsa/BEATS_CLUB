class PostsController < ApplicationController
  # skip_before_action :authenticate_user!

  def create
    @post = Post.new(posts_params)
    @community = Community.find(params[:community_id])
    @post.community = @community
    @post.profile = Profile.find_by(user_id: current_user)
    @post.likes = 0
    if @post.save!
      redirect_to community_path(@community)
    else
      render 'communities/show', status: :unprocessable_entity
    end
  end

  def posts_params
    params.require(:post).permit(:content)
  end
end
