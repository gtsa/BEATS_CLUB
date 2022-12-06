class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    feeds_path
  end

  def after_sign_up_path_for(_resource)
    new_profile_path
  end
end
