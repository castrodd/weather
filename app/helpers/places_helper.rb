module PlacesHelper
  def set_background(description)
    if description.include?('thunderstorm')
      backg = 'thunderstorm.png'
    elsif description.include?('drizzle')
      backg = 'drizzle.png'
    elsif description.include?('rain')
      backg = 'rain.png'
    elsif description.include?('snow')
      backg = 'snow.png'
    elsif description.include?('clouds')
      backg = 'clouds.png'
    elsif description.include?('breeze')
      backg = 'breeze.png'
    elsif description.include?('clear')
      backg = 'clear.png'
    elsif description.include?('calm')
      backg = 'calm.png'
    elsif description.include?('gale')
      backg = 'gale.png'
    elsif description.include?('sleet')
      backg = 'sleet.png'
    elsif description.include?('mist')
      backg = 'mist.png'
    elsif description.include?('smoke')
      backg = 'smoke.png'
    elsif description.include?('haze')
      backg = 'haze.png'
    elsif description.include?('fog')
      backg = 'fog.png'
    elsif description.include?('tropical')
      backg = 'tropical.png'
    elsif description.include?('hurricane')
      backg = 'hurricane.png'
    else
      backg = 'default.png'
    end
    image_path(backg)
  end
end
