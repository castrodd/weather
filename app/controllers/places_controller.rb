class PlacesController < ApplicationController
  require 'json'

  def new
    @place = current_user.places.new
  end


  def create
      if place_validate(params[:place][:name])
        @place = current_user.places.new(place_params)
        if @place.save
          redirect_to user_path(current_user), notice: "City added."
        else
          render :new
        end
      else
        redirect_to user_path(current_user), notice: "City unavailable."
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

  def place_validate(place)
    file = File.read('lib/assets/city.list.json')
    j = JSON.parse(file)
    j.each do |entry|
      if entry['name'] == place
        return true
      end
    end
    return false
  end
end
