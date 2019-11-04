class Subscription < ApplicationRecord
	enum payment_scheme: %i[One-time Monthly Annually]

  belongs_to :software
  belongs_to :software_suite
end
