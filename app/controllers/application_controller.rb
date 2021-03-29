class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logout_if_not_verified
    redirect_to '/' unless is_verified
  end

  def is_verified
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
