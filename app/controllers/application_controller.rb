class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @request = ''
    if request.env['omniauth.auth']
      @request = request.env['omniauth.auth']
    end
  end

end
