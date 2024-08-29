# Make a Ruby script to display the current forecast (temperature min/max, description, wind speed, etc.)
# Some features to add to your weather app:
# Display other weather data (min, max, humidity, etc)
# Ask the user for the name of a city to forecast
# Ask the user for preferred temperature units (Celcius or Farenheit)
# Write the app in a loop (once you show the forecast, the user can keep entering different cities until they choose to quit the program)
# Bonus:
# Make a separate web request to display the 5 day forecast: https://openweathermap.org/forecast5
# Make a separate web request to display other data (minute, hourly, historical): https://openweathermap.org/api/one-call-api
# Allow the user to enter a city, and tell them how much warmer/colder it will be tomorrow than right now (this will involve multiple web requests)

require "http"
require_relative "cache_http_request"

api_key = ENV['OPEN_WEATHER_API_KEY']
# weather_url = "https://api.openweathermap.org/data/2.5/weather?lat=40.785091&lon=-73.968285&appid=#{api_key}"
# file_name = "weather_data"

# http_get_json_write_to_file(url, file_name)

# # Read json
# cached = File.read("#{file_name}.json")

# pp cached

# pp cache_http_request.response.parse
# 

# Geo Lookup
puts "Please enter city:"
city_name = gets.chomp
state_code = "NY"
country_code = "US"
limit = 100
geo_url = "http://api.openweathermap.org/geo/1.0/direct?q=#{city_name},#{state_code},#{country_code}&limit=#{limit}&appid=#{api_key}"

city_response = HTTP.get(geo_url)
geo_data = city_response.parse

p geo_data
p geo_data[0]["lat"]
p geo_data[0]["lon"]

# Weather lookup
# lat = 40.785091
# lng = -73.968285
lat = geo_data[0]["lat"]
lng = geo_data[0]["lon"]
weather_url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lng}&appid=#{api_key}"

weather_response = HTTP.get(weather_url)
weather_data = weather_response.parse

p weather_data.keys

# Temp min
min_temp = weather_data["main"]["temp_min"]
p min_temp

# Temp max
max_temp = weather_data["main"]["temp_max"]
p max_temp

# Description
description = weather_data["weather"][0]["description"]
p description

# Wind speed
wind_speed = weather_data["wind"]["speed"]
p wind_speed
