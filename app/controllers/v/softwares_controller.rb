class V::SoftwaresController < ApplicationController
	def new
		@software = current_vendor.softwares.new
		get_categories
	end

	def create
		@software = current_vendor.softwares.new(software_params)
		if @software.save
			flash[:notice] = "Successfully added software"
			redirect_to vendor_dashboard_path
		else
			get_categories
			render :new
		end
	end

	private

  def software_params
    params.require(:software).permit(:name, :category, :version, :logo_url)
  end

  def get_categories
  	@categories = Software.group(:category).pluck(:category).sort
  end
end
