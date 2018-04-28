require 'pry'

class TransactionsController < ApplicationController
  before_action :require_logged_in

  def index
    #eventually clear the logged-in user's notifications here
    @transactions = Transaction.all.order('created_at DESC')
    @user.unread = 0
    @user.save
  end

  def new
    @recipient = User.find(session[:recipient_id])
  end

  def pick_friend
    @users = User.all
  end

  def prep
    session[:recipient_id] = params[:recipient_id]
    redirect_to(controller: 'transactions', action: 'new')
  end

  def show
    @transaction = Transaction.find(params[:id])
    @comments = @transaction.comments

  end

  def create
    binding.pry
    if !session[:recipient_id].nil? && !session[:recipient_id].empty? #if we get this far and we're still holding an id in session, lets drop it for cleanliness
      session.delete :recipient_id
    end
    #NEED CHECK IF BALANCE TOO LOW
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      #DRY up this logic
      #it should either be moved to the model or at least its own method. doesn't belong in controller
      #maybe something like @transaction.pay
      @transaction.pay
      redirect_to(controller: 'transactions', action: 'index')  # redirect_to 'index'
    else
      flash[:transaction_error] = "Something went wrong. Try again."
      redirect_to(controller: 'transactions', action: 'pick_friend')
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
