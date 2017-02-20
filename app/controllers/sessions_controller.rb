class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by(:uid => auth['uid']) do |u|
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
    session[:user_id] = user.id
    redirect_to root_path
  end

  def auth
    request.env['omniauth.auth']
  end
end
