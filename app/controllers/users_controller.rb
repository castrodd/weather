class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "New account created!"
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @places = @user.places.all
    @data = {}
    @places.each do |city|
      @data[city] = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city.name}&APPID=7fec57ebd6b7829c707e3637694695d5")
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :salt, :encrypted_password)
  end
end
