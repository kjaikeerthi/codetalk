class HomeController < ApplicationController
  def index
  end
  def callback
    auth_token = request.env['omniauth.auth']
    g = Git.create!(
                    :uid => auth_token['uid'], 
                    :token => auth_token["credentials"]["token"], 
                    :git_url => auth_token["user_info"]["urls"]["GitHub"], 
                    :blog => auth_token["user_info"]["urls"]["Blog"], 
                    :type => auth_token["extra"]["user_hash"]["type"], 
                    :login => auth_token["extra"]["user_hash"]["login"], 
                    :email => auth_token["extra"]["user_hash"]["email"], 
                    :company => auth_token["extra"]["user_hash"]["company"], 
                    :name => auth_token["extra"]["user_hash"]["name"], 
                    :gravatar_id => auth_token["extra"]["user_hash"]["gravatar_id"], 
                    :collaborators => auth_token["extra"]["user_hash"]["collaborators"], 
                    :public_repo_count => auth_token["extra"]["user_hash"]["public_repo_count"], 
                    :public_gist_count => auth_token["extra"]["user_hash"]["public_gist_count"], 
                    :following_count => auth_token["extra"]["user_hash"]["following_count"], 
                    :owned_private_repo_count => auth_token["extra"]["user_hash"]["owned_private_repo_count"], 
                    :total_private_repo_count => auth_token["extra"]["user_hash"]["total_private_repo_count"], 
                    :followers_count => auth_token["extra"]["user_hash"]["followers_count"], 
                    :private_gist_count =>auth_token["extra"]["user_hash"]["private_gist_count"])
    if g
      session[:git_login] = auth_token["extra"]["user_hash"]["login"]
      session[:git_email] = auth_token["extra"]["user_hash"]["email"]
      session[:git] = g
      redirect_to "/users/sign_up"
    else
      flash[:error] = "Authenticate with Github to continue Signup"
    end
  end
end
