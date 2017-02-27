class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user
      #login
    else
      flash.now[:danger] = "Invalid email and/or password."
      render 'new'
    end
  end

  def destroy
  end
end
