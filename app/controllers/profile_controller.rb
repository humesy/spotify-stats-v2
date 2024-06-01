class ProfileController < ApplicationController
  require 'net/http'

  def index
    cookies[:verifier] ||= Authentication::CreateVerifier.call
    @auth_route = Authentication::GetAuthUrl.call(cookies[:verifier])
    @profile = params["profile_data"]
  end

  def callback
    token = Api::GetAuthToken.call(cookies[:verifier], params[:code])
    details = Api::GetUserDetails.call(token)

    redirect_to root_path(params: { profile_data: details })
  end
end
