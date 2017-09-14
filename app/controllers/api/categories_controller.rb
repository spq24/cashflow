class Api::CategoriesController < Api::BaseController
	before_action :authenticate_with_token!
	before_action :set_category, only: [:show, :update, :destroy]
	respond_to :json

	def create
		binding.pry
		category = Category.new(category_params)
		if category.save
			render json: category, status: 200, location: [:api, category]
		else
			render json: { errors: category.errors }, status: 422
		end
	end

	def show
		render json: @category, status: 200, location: [:api, @category]
	end

	def index
		render json: { total_results: Category.all.pluck(:id).count, categories: Category.all }, status: 200
	end

	def update
		if @category.update(category_params)
			render json: @category, status: 200, location: [:api, @category]
		else
			render json: { errors: @category.errors }, status: 422
		end
	end

	def destroy
		if @category.destroy
			render json: @category, status: 204, location: [:api, @category]
		else
			render json: { errors: @category.errors }, status: 422
		end
	end

	private

		def category_params
			params.require(:category).permit(:name, :description, :user_id)
		end

		def set_category
			@category = Category.find(params[:id])
		end
end