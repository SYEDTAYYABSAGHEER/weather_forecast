require 'httparty'
class WeatherForecastService

  def initialize(api_key, city)
    @api_key = api_key
    @city = city
  end


  def get_weather
    puts @api_key
    response = HTTParty.get("http://api.weatherapi.com/v1/current.json?q=#{@city}&key=#{@api_key}")
    response.parsed_response
  end
end