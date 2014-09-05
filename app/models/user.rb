class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  validates :username, uniqueness: { case_sensitive: false }

  before_save do
    self.username.downcase! if self.username
    self.email.downcase! if self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def twitter_handle
    twitter[1..-1]
  end

  def twitter_link
    "https://twitter.com/#{twitter_handle}"
  end
end
