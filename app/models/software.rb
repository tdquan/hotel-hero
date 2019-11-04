class Software < ApplicationRecord
  has_many :subscriptions
  has_many :software_suites, through: :subscriptions

  belongs_to :vendor
end
