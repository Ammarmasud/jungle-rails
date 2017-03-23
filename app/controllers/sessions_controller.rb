class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # success logic, log them in
      session[:user_id] = user.id
      redirect_to '/'
    else
      # failure, render login form
      redirect_to '/login', error: 'User could not be authenticated'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
