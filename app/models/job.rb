class Job < ActiveRecord::Base

  belongs_to :company

  validates :title, presence: true
  validates :city, presence: true
  validates :description, presence: true
end
