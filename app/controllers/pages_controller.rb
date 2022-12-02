class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_nav = true
  end

  def myprofile
    @profile = current_user.profiles.first
    @user_check = current_user == @profile.user
    raise
  end
end
