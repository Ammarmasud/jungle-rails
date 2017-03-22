class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.email = @user.email.downcase
    # if !(User.find_by_email(@user.email)) && @user.save
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup', error: "signup error"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
