class Software < ApplicationRecord
	validates :name, :category, :logo_url, presence: true

  has_many :subscriptions
  has_many :software_suites, through: :subscriptions

  belongs_to :vendor
end
