class ApplicationController < ActionController::API
    config.api_only = true
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def record_not_found(error)
    render json: { status: 'ERROR', message: error.message }, status: :not_found
    end
end