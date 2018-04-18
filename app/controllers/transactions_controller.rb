class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all.order('created_at DESC')
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Bonecoin sent.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new'}
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
  end

end
