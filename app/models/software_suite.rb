class SoftwareSuite < ApplicationRecord
	attr_accessor :subscription
	has_many :subscriptions
	has_many :softwares, through: :subscriptions

  belongs_to :hotelier
end
