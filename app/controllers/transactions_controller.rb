

class TransactionsController < ApplicationController
  before_action :require_logged_in

  def index
    @section_title = "Activity"
    #eventually clear the logged-in user's notifications here
    @transactions = Transaction.all.order('created_at DESC')
    @user.unread = 0
    @user.save
  end

  def new
    @section_title = "Send Coin"
    @recipient = User.find(session[:recipient_id])
  end

  def pick_friend
    @section_title = "Send Coin"
    @users = User.all
    @users = @users.to_a #change this to an array in memory to avoid any effect on the db
    @users.delete(@user) #remove the logged-in user from the list of people to send to
  end

  def prep
    session[:recipient_id] = params[:recipient_id]
    redirect_to(controller: 'transactions', action: 'new')
  end

  def show
    @section_title = "Comments"
    @transaction = Transaction.find(params[:id])
    @comments = @transaction.comments

  end

  def create

    if !session[:recipient_id].nil? && !session[:recipient_id].empty? #if we get this far and we're still holding an id in session, lets drop it for cleanliness
      session.delete :recipient_id
    end
    #NEED CHECK IF BALANCE TOO LOW
    @transaction = Transaction.new(transaction_params)

    # if @transaction.save
      #DRY up this logic
      #it should either be moved to the model or at least its own method. doesn't belong in controller
      #maybe something like @transaction.pay

    if @transaction.user_id == @transaction.recipient_id
      flash[:infinite_money] = "Sending money to yourself? Nice try, dick."
      redirect_to(controller: 'transactions', action: 'pick_friend')
    end

    if @transaction.pay
      redirect_to(controller: 'transactions', action: 'index')  # redirect_to 'index'
    else
      flash[:transaction_error] = "Something went wrong. Try again."
      redirect_to(controller: 'transactions', action: 'pick_friend')
    end

    # else
    #   flash[:transaction_error] = "Something went wrong. Try again."
    #   redirect_to(controller: 'transactions', action: 'pick_friend')
    # end
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
