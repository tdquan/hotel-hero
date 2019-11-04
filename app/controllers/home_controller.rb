class HomeController < ApplicationController
	def hotelier_dashboard
		@suites = current_hotelier.software_suites.includes(:softwares)
		@sorted = @suites.group_by { |suite| suite.category }
	end

	def vendor_dashboard
		@softwares = current_vendor.softwares
		@sorted = @softwares.group_by { |software| software.category }
	end
end
