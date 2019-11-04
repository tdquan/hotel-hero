class Api::V1::SoftwaresController < Api::V1::BaseController
	def index
		vendor = Vendor.find(params[:id])
		softwares = vendor.softwares.all
		render json: softwares
	end

	def create
		software = Software.new(software_params)
		if software.save
			render json: software
		else
			render json: { error: software.errors }
		end
	end

	private

	def software_params
		params.require(:software).permit(:name, :category, :version, :vendor_id, :logo_url)
	end
end
