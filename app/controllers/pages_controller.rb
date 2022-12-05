class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_nav = true
    @disable_bottom = true
  end

  def myprofile
    # redirect_to profile_path(current_user.id) if user_signed_in?
    @profile = Profile.find_by(user: current_user)
    # @user_check = current_user == @profile.user
  end


end
