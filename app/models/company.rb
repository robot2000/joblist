class Company < ActiveRecord::Base

  has_many :jobs

  validates :name, presence: true
  validates :country, presence: true
  validates :industry, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :phone, presence: true, uniqueness: true
end
