class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # success logic, log them in
      session[:user_id] = User.find_by_email(params[:email]).id
      redirect_to '/'
    else
      # failure, render login form
      redirect_to '/login', error 'User could not be authenticated'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
