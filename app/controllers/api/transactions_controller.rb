class Api::TransactionsController < Api::BaseController
	#before_action :authenticate_with_token!
	before_action :set_transaction, only: [:show, :update, :destroy]
	respond_to :json

	def create
		transaction = Transaction.new(transaction_params)
		if transaction.save
			render json: transaction, status: 200, location: [:api, transaction]
		else
			render json: { errors: transaction.errors }, status: 422
		end
	end

	def show
		render json: @transaction, status: 200, location: [:api, @transaction]
	end

	def index
		transactions = []
		Transaction.all.map { |t| transactions << {id: t.id, description: t.description, formatted_amount: Money.new(t.amount_in_cents, "USD").format, amount_in_cents: t.amount_in_cents, user_id: t.user_id, user_name: t.user_full_name}}
		render json: { total_results: transactions.count, transactions: transactions }, status: 200
	end

	def update
		if @transaction.update(transaction_params)
			render json: @transaction, status: 200, location: [:api, @transaction]
		else
			render json: { errors: @transaction.errors }, status: 422
		end
	end

	def destroy
		if @transaction.destroy
			render json: @transaction, status: 204, location: [:api, @transaction]
		else
			render json: { errors: @transaction.errors }, status: 422
		end
	end

	private

		def transaction_params
			params.require(:transaction).permit(:description, :amount_in_cents, :debit, :credit, :notes, :user_id, :date_recorded, :category_id)
		end

		def set_transaction
			@transaction = Transaction.find(params[:id])
		end
end