class Api::V1::BaseController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, with: :not_found
	rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
	rescue_from ActionController::ParameterMissing, with: :bad_request

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def unprocessable_entity(exception)
    render json: { error: exception.record.errors }, status: :unprocessable_entity
  end

  def bad_request(exception)
  	render json: { error: exception.message }, status: :bad_request
  end
end
