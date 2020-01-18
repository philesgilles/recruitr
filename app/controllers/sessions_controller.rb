class SessionsController < ApplicationController
  def new
  
  end
  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:user_role] = user.role
      flash[:success] = "You are logged in"
      redirect_to root_path
    else
      flash.now[:danger] = "Holy Guacamole... Login failed !"
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    session[:user_role] = nil
    redirect_to login_path
  end
    
end