class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :email, :password, :firstname, :lastname, presence: true #:firstname, :lastname
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, 
  #        :validatable, :omniauthable,
  #        :omniauth_providers => [:facebook]

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #     user.firstname = auth.info.name.split[0]   # assuming the user model has a name
  #     user.lastname = auth.info.name.split[1]
  #     # user.image = auth.info.image # assuming the user model has an image
  #   end
  # end
end
