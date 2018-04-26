class TransactionsController < ApplicationController

  def index
    #eventually clear the logged-in user's notifications here
    @transactions = Transaction.all.order('created_at DESC')
  end

  def new
    @user = User.find(params[:recipient_id])
  end

  def pick_friend
    @users = User.all
  end

  def create
    #NEED CHECK IF BALANCE TOO LOW
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        #DRY up this logic
        #it should either be moved to the model or at least its own method. doesn't belong in controller
        #maybe something like @transaction.pay
        @transaction.pay
        format.html { redirect_to(transactions_url) }
        format.json { render action: 'index', status: :created }
        # redirect_to 'index'
      else
        format.html { render action: 'new'}
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_ingredient
  #   @ingredient = Ingredient.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    params.require(:transaction).permit(:user_id, :recipient_id, :note, :amount)
  end

end
