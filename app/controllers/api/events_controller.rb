class API::EventsController < ApplicationController
  before_filter :set_access_control_headers
  
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*' # Allow requests from any origin
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS' # Permit POST, GET, OPTIONS request methods
    headers['Access-Control-Allow-Headers'] = 'Content-Type' # Allow header Content-Type (HTTP uses in request to declare the type of data being sent)
  end
  
  skip_before_action :verify_authenticity_token

  def create
    @registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    
    if RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN']) === nil
      render json: "Unregistered application", status: :unprocessable_entity
    end
  end
  
  def preflight
    head 200
  end
end