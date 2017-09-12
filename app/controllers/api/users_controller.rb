class Api::UsersController < Api::BaseController
	before_action :authenticate_with_token!
	respond_to :json

	def show
		render json: @user, status: 200, location: [:api, @user]
	end

	def index
		@user = User.all.page(params[:page])
	end

	private

		def user_params
			params.require().permit()
		end
end
