class Software < ApplicationRecord
	validates :name, :category, :logo_url, presence: true
	validates :category, inclusion: { in: ["Human Resource", "Booking Management", "Marketing", "Accounting", "Operations", "Guest Services", "F&B", "IT", "MICE"] }

  has_many :subscriptions
  has_many :software_suites, through: :subscriptions

  belongs_to :vendor
end
