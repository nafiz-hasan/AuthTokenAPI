require 'application_responder'

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :html

  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    # @current_user = AuthorizeApiRequest.call(request.headers).result
    # render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
