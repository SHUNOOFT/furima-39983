class ApplicationController < ActionController::Base
  before_action :basic_auth


  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'BASIC_AUTH_USER' && password == 'BASIC_AUTH_PASSWORD'
    end
  end
end
