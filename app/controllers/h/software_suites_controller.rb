class H::SoftwareSuitesController < ApplicationController
	def create
		@suite = current_hotelier.software_suites.new(suite_params)
		@software = Software.find(params[:software_suite][:software_id])
		@suite.subscriptions.new(payment_scheme: params[:software_suite][:subscription][:payment_scheme], software_id: @software.id)
		if @suite.save
			flash[:notice] = "Software added"
			redirect_to h_softwares_path
		else
			flash[:alert] = "Failed to add software"
			redirect_to h_software_path(@software)
		end
	end

	def update
		@suite = SoftwareSuite.find(params[:software_suite][:id])
		@software = Software.find(params[:software_suite][:software_id])
		@subscription = @suite.subscriptions.new(payment_scheme: params[:software_suite][:subscription][:payment_scheme], software_id: @software.id)
		if @suite.update(suite_params)
			flash[:notice] = "Software added"
			redirect_to h_softwares_path
		else
			flash[:alert] = "Failed to add software"
			redirect_to h_software_path(@software)
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
