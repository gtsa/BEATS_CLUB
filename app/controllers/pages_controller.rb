class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_nav = true
  end

  def myprofile
    @profile = current_user.profiles.first
    if @profile.nil?
      redirect_to '/profiles/new', alert: "You haven't yet created your profile!"
    else
      @user_check = current_user == @profile.user
    end
  end
end
