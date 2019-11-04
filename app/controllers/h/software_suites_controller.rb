class H::SoftwareSuitesController < ApplicationController
	def new
		@suite = current_hotelier.software_suites.new
	end
end
