class ApplicationController < ActionController::API
  rescue_from ArgumentError, with: :render_bad_credentials_response
  private
  
  def render_bad_credentials_response(invalid)
    render json: ErrorSerializer.bad_subscription
  end


end
