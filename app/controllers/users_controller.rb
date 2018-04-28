
class UsersController < ApplicationController
  before_action :require_logged_in
  skip_before_action :require_logged_in, only: [:new, :create]
  layout "application", except: [:new]

  def index
    @section_title = "Friends"
    @users = User.all
  end

  def show
    @user_profile = User.find(params[:id])
    @section_title = @user_profile.username + "'s Profile"
    if @user_profile.shouts.count > 0
      @shouts = @user_profile.shouts
    end
  end

  def new
    @section_title = "Sign Up"

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
    @section_title = "Edit Profile"
    if @user.id != Integer(params[:id]) #gotta convert the param to an integer to compare
      redirect_to controller: 'users', action: 'index'
    end

  end

  def update
    user = @user
    user.update(user_params)
    # unless user_params[:bio].nil? || user_params[:bio].empty?
    #   user.bio = user_params[:bio]
    # end
    # unless user_params[:avatar].nil? || user_params[:avatar].empty?
    #
    # end
    if user.save
      redirect_to controller: 'users', action: 'show', id: @user.id
    else
      flash[:error] = "Something went wrong. Please try again."
      redirect_to controller: 'users', action: 'show', id: @user.id
    end


  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :bio, :avatar)
  end


end
