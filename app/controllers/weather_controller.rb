class WeatherController < ApplicationController
  def update
    weather_api =  Rails.application.credentials.weather_api[:api_key]
    city = Rails.application.credentials.weather_api[:city]
    forecast_service = WeatherForecastService.new(weather_api, city)
    @weather = forecast_service.get_weather
    erb = ERB.new(File.read(Rails.root.join('README.md.erb'))).result(binding)
    File.write(Rails.root.join('README.md'), erb)
    redirect_to root_path, notice: 'Weather forecast updated!'
  end
end