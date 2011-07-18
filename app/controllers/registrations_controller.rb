class RegistrationsController < Devise::RegistrationsController
  def new
    auth_token = request.env['omniauth.auth']
    if not auth_token.nil?
      @git = create_git(auth_token)
      resource = build_resource({})
      resource.username = @git.login
      resource.email = @git.email
      resource.git_login = @git.login
      respond_with_navigational(resource){ render_with_scope :new }
    else
      redirect_to "/auth/github"
    end
  end

  def create
    super
  end

  def update
    super
  end

  private

  def create_git(auth_token)
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
  end
end
