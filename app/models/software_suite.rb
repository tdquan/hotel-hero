class SoftwareSuite < ApplicationRecord
	has_many :subscriptions
	has_many :softwares, through: :subscriptions

  belongs_to :hotelier
end
