class HomeController < ApplicationController
  def index
  end
  def callback
    auth_token = request.env['omniauth.auth']
    session[:git_login] = auth_token["extra"]["user_hash"]["login"]
    session[:git_token] = auth_token["credentials"]["token"]
    session[:git_email] = auth_token["extra"]["user_hash"]["email"]    
    redirect_to "/users/sign_up"
  end
end
