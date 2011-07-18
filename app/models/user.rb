class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  field :email
  field :username
  field :github_login
  field :github_token
  belongs_to :git
  attr_accessible :email, :password, :password_confirmation, :remember_me
  validates_presence_of :email
  validates_uniqueness_of :email, :username, :case_sensitive => false
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
