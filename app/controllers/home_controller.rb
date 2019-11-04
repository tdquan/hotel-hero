class HomeController < ApplicationController
	def index
	end

	def dashboard
	end

	def hotelier_dashboard
	end

	def vendor_dashboard
		@softwares = current_vendor.softwares
		@sorted = @softwares.group_by { |software| software.category }
	end
end
