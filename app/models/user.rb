class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  field :email
  field :username
  field :git_login
  belongs_to :git

  attr_accessible :email,:username, :git_login, :password, :password_confirmation, :remember_me
  validates_presence_of :email
  validates_uniqueness_of :email, :username, :git, :case_sensitive => false
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :set_git_account

  def set_git_account
    g = Git.where(:login => self.git_login).first
    self.git = g
  end
end
