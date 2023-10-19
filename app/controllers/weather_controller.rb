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

  def index;  end
end

# My Current Address:

# City: <%= @weather["location"]["name"] %>
# State: <%= @weather["location"]["region"] %>
# Country: <%= @weather["location"]["country"] %>
# Local Time: <%= @weather["location"]["localtime"] %>
# TimeZone: <%= @weather["location"]["tz_id"] %>
# Temperature in  Celsius: <%= @weather["current"]["temp_c"] %> °C
# Temperature in  Fahrenheit: <%= @weather["current"]["temp_c"] %> °F
# <% if is @weather["condition"]["text"] == 0 %>
#    Night
# <%else%>
#     Day
# <%end%>
# Condition in <%= @weather["location"]["country"] %>
#  <%= @weather["location"]["country"] %>   <%= @weather["location"]["icon"] %>



# # Feel free to check out my projects below!


# # [![Update Weather](https://img.shields.io/badge/Update%20Weather-Click%20Here-brightgreen)](https://your-app-url/update_weather)

# # {"location"=>
# #   {"name"=>"Lahore",
# #    "region"=>"Punjab",
# #    "country"=>"Pakistan",
# #    "lat"=>31.55,
# #    "lon"=>74.34,
# #    "tz_id"=>"Asia/Karachi",
# #    "localtime_epoch"=>1697752301,
# #    "localtime"=>"2023-10-20 2:51"},
# #  "current"=>
# #   {"last_updated_epoch"=>1697751900,
# #    "last_updated"=>"2023-10-20 02:45",
# #    "temp_c"=>20.0,
# #    "temp_f"=>68.0,
# #    "is_day"=>0,
# #    "condition"=>
# #     {"text"=>"Overcast",
# #      "icon"=>"//cdn.weatherapi.com/weather/64x64/night/122.png",
# #      "code"=>1009},
# #    "wind_mph"=>2.2,
# #    "wind_kph"=>3.6,
# #    "wind_degree"=>10,
# #    "wind_dir"=>"N",
# #    "pressure_mb"=>1015.0,
# #    "pressure_in"=>29.97,
# #    "precip_mm"=>0.0,
# #    "precip_in"=>0.0,
# #    "humidity"=>68,
# #    "cloud"=>0,
# #    "feelslike_c"=>20.0,
# #    "feelslike_f"=>68.0,
# #    "vis_km"=>4.0,
# #    "vis_miles"=>2.0,
# #    "uv"=>1.0,
# #    "gust_mph"=>8.9,
# #    "gust_kph"=>14.4}}