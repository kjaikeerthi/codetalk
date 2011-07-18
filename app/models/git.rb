class Git
  include Mongoid::Document

  field :uid
  field :token
  field :git_url
  field :blog
  field :type
  field :login
  field :email
  field :company
  field :name
  field :gravatar_id
  field :collaborators
  field :public_repo_count
  field :public_gist_count
  field :following_count
  field :owned_private_repo_count
  field :total_private_repo_count
  field :followers_count
  field :private_gist_count
  belongs_to :user
  validates_uniqueness_of :user, :login
end
