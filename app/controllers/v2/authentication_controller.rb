module V2
  class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    def authenticate
      command = AuthenticateUser.call(params[:email], params[:password])

      if command.success?
        render json: { auth_token_v2: command.result }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end
  end
end
