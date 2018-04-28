require 'pry'

class UsersController < ApplicationController
  before_action :require_logged_in
  skip_before_action :require_logged_in, only: [:new, :create]
  layout "application", except: [:new]

  def index
    @users = User.all
  end

  def show
    @user_profile = User.find(params[:id])
    binding.pry
  end

  def new

  end

  def create
    @user = User.create(user_params)
    # return redirect_to controller: 'users', action: 'new' unless @user.save
    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'transactions', action: 'index'
    else
      flash[:error] = "Something went wrong. Please try again."
      redirect_to controller: 'users', action: 'new'
    end
  end

  def edit

    if @user.id != Integer(params[:id]) #gotta convert the param to an integer to compare
      redirect_to controller: 'users', action: 'index'
    end

  end

  def update



  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end


end
