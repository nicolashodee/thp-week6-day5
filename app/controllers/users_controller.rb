class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :age, :city_id, :email, :password, :password_confirmation)
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User sucessfully created !"
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  end
end
