class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:user)
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      flash[:success] = "Hello #{user.first_name} !"
      redirect_to "/"
    else
      flash[:danger] = 'Incorrect email / password'
      render :new
      end
  end

  def destroy
    session.delete(:user_id)
    flash[:danger] = 'You logged out'
    redirect_to "/"
  end
end
