class UsersController < ApplicationController
  respond_to :html, :json

  def new
    @user = User.new
    respond_modal_with @user
  end

  def create
    @user = User.new(user_params)
    respond_modal_with @user, location: root_path
    if @user.save
      redirect_to root_path, notice: "New account created! Please log in."
    else
      render :new
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
