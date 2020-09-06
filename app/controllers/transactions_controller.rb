class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.all
  end

  def show; end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @flat = Flat.find(transaction_params[:flat_id])
    @transaction.flat = @flat
    @transaction.user = current_user
    if @transaction.category == 'Payment'
      @flat.balance -= @transaction.amount
    else
      @flat.balance += @transaction.amount
    end
    @transaction.save!
    @flat.save!
    redirect_to flat_path(transaction_params[:flat_id])
  end

  def edit; end

  def update
    @transaction.update(transaction_params)
    redirect_to transaction_path(@transaction)
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_path
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:title, :amount, :flat_id)
  end
end
