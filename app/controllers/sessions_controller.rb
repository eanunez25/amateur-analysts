class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        flash.now[:danger] = "Invalid username/password combination"
        render 'new'
      end
    else
      message = "Account not activated."
      message += "Check your email for the activation link."
      flash[:warning] = message
      redirect_to root_url
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "You are logged out."
    redirect_to root_url
  end

end
