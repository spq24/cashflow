class TransactionsController < ApplicationController
	before_action :set_transaction, only: [:edit, :show, :update, :destroy]

	def new
		@transaction = Transaction.new
	end

	def create
		@transaction = Transaction.new(transaction_params)
		if @transaction.save
			flash[:success] = "Successfully created transaction"
			redirect_to root_path
		else
			flash[:danger] = @transaction.errors.full_messages.to_sentence
			redirect_to render :new
		end
	end

	def show
	end

	def edit
	end

	def index
		@transactions = Transaction.all
	end

	def update
		if @transaction.update(transaction_params)
			flash[:success] = "Successfully updated transaction"
			redirect_to root_path
		else
			flash[:danger] = @transaction.errors.full_messages.to_sentence
			redirect_to render :edit
		end
	end

	def destroy
		if @transaction.destroy
			flash[:success] = "Successfully deleted transaction"
			redirect_to root_path
		else
			flash[:danger] = @transaction.errors.full_messages.to_sentence
			redirect_to render :edit
		end
	end
	
	private

		def transaction_params
			params.require().permit(:description, :amount_in_cents, :debit, :credit, :notes, :user_id, :date_recorded, :category_id)
		end

		def set_transaction
			@transaction = Transaction.find(params[:id])
		end
end
