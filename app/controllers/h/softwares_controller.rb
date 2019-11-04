class H::SoftwaresController < ApplicationController
	def index
		all_softwares = Software.includes(:vendor).all
		@hotelier_softwares = current_hotelier.softwares
		@sorted_by_category = all_softwares.group_by { |software| software.category }
		@sorted_by_vendor = all_softwares.group_by { |software| software.vendor }
	end

	def show
		@softwares = current_hotelier.softwares
		@software = Software.find(params[:id])
		@suite = current_hotelier.software_suites.find_or_initialize_by(category: @software.category)
		@subscription = @suite.subscriptions.new(software_id: @software.id)
	end
end
