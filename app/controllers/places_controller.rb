class PlacesController < ApplicationController
  require 'json'

  def new
    @place = current_user.places.new
  end


  def create
      name = place_validate(params[:place][:name])
      if name
        params[:name] = name
        @place = current_user.places.new(place_params)
        if @place.save
          redirect_to user_path(current_user), notice: "City added."
        else
          render :new
        end
      else
        redirect_to user_path(current_user), notice: "City unavailable. Perhaps check your spelling."
      end
  end

  def show
    @place = Place.find_by(id: params[:id])
    @data = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{@place.name}&APPID=7fec57ebd6b7829c707e3637694695d5")
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
    #Checks user input and replaces with API's official name
    file = File.read('lib/assets/city.list.json')
    j = JSON.parse(file)
    j.each do |entry|
      if place.match(/#{Regexp.quote(entry['name'])}/i)
        return entry['name']
      end
    end
    return false
  end
end
