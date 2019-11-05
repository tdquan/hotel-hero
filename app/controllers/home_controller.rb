class HomeController < ApplicationController
	def hotelier_dashboard
		@suites = current_hotelier.software_suites.includes(:softwares)
		@sorted = @suites.sort_by(&:category).group_by(&:category)
	end

	def vendor_dashboard
		@softwares = current_vendor.softwares
		@sorted = @softwares.sort_by(&:category).group_by(&:category)
	end
end
