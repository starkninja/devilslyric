class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all.order('created_at DESC')
  end

end
