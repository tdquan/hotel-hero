class H::SoftwareSuitesController < ApplicationController
	def create
		@suite = current_hotelier.software_suites.new(suite_params)
		@suite.subscriptions.new(payment_scheme: params[:software_suite][:subscription][:payment_scheme])
		if @suite.save
			flash[:notice] = "Software added"
			redirect_to h_softwares_path
		else
			@softwares = current_hotelier.softwares
			@software = Software.find(params[:software_suite][:subscription][:software_id])
			@suite = current_hotelier.software_suites.find_or_initialize_by(category: @software.category)
			@subscription = @suite.subscriptions.new(software_id: @software.id)
			render template: "h/softwares/show"
		end
	end

	def update
		@suite = SoftwareSuite.find(params[:id])
		if @suite.update(suite_params)
			flash[:notice] = "Software added"
			redirect_to h_softwares_path
		else
			@softwares = current_hotelier.softwares
			@software = Software.find(params[:software_suite][:subscription_attributes][:software_id])
			@suite = current_hotelier.software_suites.find_or_initialize_by(category: @software.category)
			@subscription = @suite.subscriptions.new(software_id: @software.id)
			render template: "h/softwares/show"
		end
	end

	private

	def get_categories
  	@categories = SoftwareSuite.group(:category).pluck(:category).sort
  end

  def suite_params
  	params.require(:software_suite).permit(:category, subscription: [:payment_scheme])
  end
end
