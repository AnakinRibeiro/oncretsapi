class ApplicationController < ActionController::Base
  require 'auth_token'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  #before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit

  around_action :set_current_user

  def set_current_user
    Current.user = current_user
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    Current.user = nil
  end             

  protected

  ##
  # This method can be used as a before filter to protect
  # any actions by ensuring the request is transmitting a
  # valid JWT.
  def verify_jwt_token
    begin
      if request.format.json?
        token = request.headers['Authorization'].split(' ').last
        decoded_token = JWT.decode token, nil, false
        @current_user = User.find(decoded_token[0]["user_id"])
        head :unauthorized if request.headers['Authorization'].nil? || !AuthToken.valid?(token)
      else
        authenticate_user!
      end
    rescue => exception
      head :unauthorized 
    end
  end
end
