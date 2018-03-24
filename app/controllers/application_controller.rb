class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	return User.find_by_id(cookies.signed[:user_id])
  end
end
