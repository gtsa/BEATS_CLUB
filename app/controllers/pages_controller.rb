class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_nav = true
    @disable_bottom = true
  end

  def myprofile
    @profile = current_user.profiles.first
    if @profile.nil?
      redirect_to '/profiles/new'
    else
      @user_check = current_user == @profile.user
    end
  end
end
