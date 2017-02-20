class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def index
    @user = User.find_by_id(session[:id])
  end

end
