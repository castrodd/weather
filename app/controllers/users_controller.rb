class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Account Created!"
    else
      render root_path, notice: "Please try again."
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @places = @user.places.all
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :salt, :encrypted_password)
  end
end
