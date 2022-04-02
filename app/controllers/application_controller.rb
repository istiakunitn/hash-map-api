class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :set_cors

  def set_cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end
end
