class HomeController < ApplicationController
  def index
    if logged_in?
      redirect_to user_path(current_user)
    else
      @data = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=7fec57ebd6b7829c707e3637694695d5')
    end
  end
end
