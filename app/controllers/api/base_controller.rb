class Api::BaseController < ApplicationController

	def authenticate_with_token!
		auth_token = request.headers.env["HTTP_API_KEY"]
		user = User.where(auth_token: auth_token).first if auth_token.present?
		render json: { errors: "Missing or incorrect auth token" },
		                 status: :unauthorized unless user.present?
    end
end