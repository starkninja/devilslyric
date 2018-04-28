require 'pry'

class CommentsController < ApplicationController

  before_action :require_logged_in

  def create

    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to(controller: 'transactions', action: 'show', id: @comment.transaction_id)  # redirect_to the transaction in question
    elsif !comment_params[:transaction_id].nil? && !comment_params[:transaction_id].empty?
      flash[:comment_error] = "Something went wrong. Try again."
      binding.pry
      redirect_to(controller: 'transactions', action: 'show', id: @comment.transaction_id) #if we've got the transaction_id we can go back there and throw an error
    else
      redirect_to(controller: 'transactions', action: 'index') #in case things are really messed up we'll just go home
    end

    # consider changing some of this logic up later
    # in transaction#show we could add - session[:return_to] ||= request.referer
    # and then here utilize - redirect_to session.delete(:return_to)
    # https://stackoverflow.com/questions/2139996/how-to-redirect-to-previous-page-in-ruby-on-rails


  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:user_id, :transaction_id, :content)
  end

end
