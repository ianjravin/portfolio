class ApplicationController < ActionController::Base
  include
  rescue_from ::NotAuthorizedError, with: :user_not_authorized
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action"
    redirect_to request.headers["Referer"] || root_path
  end
end
