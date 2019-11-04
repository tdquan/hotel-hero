class SoftwareSuite < ApplicationRecord
	attr_reader :subscription
	has_many :subscriptions
	has_many :softwares, through: :subscriptions

  belongs_to :hotelier

  accepts_nested_attributes_for :subscription
end
