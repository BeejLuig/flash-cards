class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def user_verified?
    params[:user_id].to_i == current_user.id
  end

  def whoops
    flash[:notice] = "Whoops! You can't go there."
    redirect_to user_path(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:image])
  end

end
