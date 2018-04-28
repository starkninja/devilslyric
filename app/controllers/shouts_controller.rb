class ShoutsController < ApplicationController


  def create
    @shout = Shout.new(shout_params)

    if @shout.save
      @user = User.find(shout_params[:user_id])
      @user.increment!(:unread_shouts)
      redirect_to(controller: 'users', action: 'show', id: shout_params[:user_id])
    else
      flash[:shout_error] = "Something went wrong. Try again."
      redirect_to :back
    end
  end




  private

  def shout_params
    params.require(:shout).permit(:user_id, :author_id, :content)
  end


end
