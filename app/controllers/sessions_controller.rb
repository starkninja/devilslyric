class SessionsController < ApplicationController

  def new
    @section_title = "Log In"
  end

  def create
    user = User.find_by(username: params[:user][:username])

    user = user.try(:authenticate, params[:user][:password])

    # return redirect_to(controller: 'sessions', action: 'new') unless user

    if !user
      flash[:error] = "Wrong username or password. Please try again."
      return redirect_to(controller: 'sessions', action: 'new')
    end

    session[:user_id] = user.id

    @user = user

    redirect_to root_path
  end

  def destroy
    session.delete :user_id

    redirect_to(controller: 'sessions', action: 'new')
  end


end
