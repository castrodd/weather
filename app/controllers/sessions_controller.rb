class SessionsController < ApplicationController
  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now[:notice] = "Something was wrong with your email and/or password."
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: "Logged out!"
  end
end
