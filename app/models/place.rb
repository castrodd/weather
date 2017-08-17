class Place < ApplicationRecord
  validate :place_validate
  def place_validate
    data = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{name}&APPID=7fec57ebd6b7829c707e3637694695d5").parsed_response
    if data['cod'] != 200 || data['name'].downcase != name.downcase
      errors.add(:name, "This city does not exist!")
    end
  end
  belongs_to :user
end
