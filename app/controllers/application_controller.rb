class ApplicationController < ActionController::Base
  # Added this code b/c of CSRF error when testing API endpoints
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
end
