class Subscription < ApplicationRecord
	enum payment_scheme: %i[One-time Monthly Annually]
	validates :payment_scheme, presence: true

  belongs_to :software
  belongs_to :software_suite
end
