class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def myprofile
    redirect_to profile_path(current_user.id) if user_signed_in?
  end
end
