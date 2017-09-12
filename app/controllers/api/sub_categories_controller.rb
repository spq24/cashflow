class Api::SubCategoriesController < Api::BaseController
	before_action :authenticate_with_token!
	before_action :set_sub_category, only: [:show, :update, :destroy]
	respond_to :json

	def create
		sub_category = SubCategory.new(sub_category_params)
		if sub_category.save
			render json: sub_category, status: 200, location: [:api, sub_category]
		else
			render json: { errors: sub_category.errors }, status: 422
		end
	end

	def show
		render json: @sub_category, status: 200, location: [:api, @sub_category]
	end

	def index
		render json: { total_results: SubCategory.all.pluck(:id).count, sub_categories: SubCategory.all }, status: 200
	end

	def update
		if @sub_category.update(sub_category_params)
			render json: @sub_category, status: 200, location: [:api, @sub_category]
		else
			render json: { errors: @sub_category.errors }, status: 422
		end
	end

	def destroy
		if @sub_category.destroy
			render json: @sub_category, status: 204, location: [:api, @sub_category]
		else
			render json: { errors: @sub_category.errors }, status: 422
		end
	end

	private

		def category_params
			params.require(:sub_category).permit(:name, :description, :user_id)
		end

		def set_category
			@sub_category = SubCategory.find(params[:id])
		end
end
