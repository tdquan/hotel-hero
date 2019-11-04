class Hotelier < User
	has_many :software_suites
	has_many :softwares, through: :software_suites
end
