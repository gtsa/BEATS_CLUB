class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_nav = true
    @disable_bottom = true
  end

  def feeds
    @profile = current_user.profiles.first
    @posts = @profile.communities.map(&:posts).flatten
    @posts = @posts.sort_by(&:created_at)
    @posts_author_likes = @posts.map do |post|
      { post:, author: Profile.find(post.profile_id), likes: Like.where(profile_id: post.profile_id) }
    end
  end

  def myprofile
    # redirect_to profile_path(current_user.id) if user_signed_in?
    @profile = Profile.find_by(user: current_user)
    # @user_check = current_user == @profile.user
  end


end
