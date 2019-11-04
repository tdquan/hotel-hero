class Subscription < ApplicationRecord
  belongs_to :software
  belongs_to :software_suite
end
