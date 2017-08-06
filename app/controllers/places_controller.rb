class PlacesController < ApplicationController

  def new
    @place = current_user.places.new
  end


  def create
    @place = current_user.places.new(place_params)
    if @place.save
      redirect_to user_path(current_user), notice: "City added."
    else
      render :new
    end
  end

  def destroy
    place = Place.find_by(id: params[:id])
    place.destroy
    redirect_to user_path(current_user), notice: "City removed."
  end

  private
  def place_params
    place = params.require(:place).permit(:name, :user_id)
  end
end
