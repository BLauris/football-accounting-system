class User < ActiveRecord::Base
  ADMIN = 1
  USER = 2

  ROLES = [["Administrator", ADMIN],["User", USER]]

  after_save :setup_role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :team_name, :tournament_ids, :role
  # attr_accessible :title, :body

  has_many :coaches
  has_many :players
  has_many :staffs
  has_and_belongs_to_many :tournaments

  def is_admin?
    self.role == ADMIN
  end

  def is_user?
    self.role == USER
  end

  def self.roles
    ROLES
  end

  def first_image_url
    if assets.first
      assets.first.file(:thumb)
    else
      "no_img.jpg"
    end
  end  

  def setup_role 
    self.role == USER
  end

end
