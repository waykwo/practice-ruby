# Make a Ruby script to display the data from an API (choose one)
# Chicago employee data:
# https://data.cityofchicago.org/resource/xzkq-xp2w.json
# San Francisco food truck schedule:
# https://data.sfgov.org/resource/jjew-r69b.json
# NY farmers markets:
# https://data.ny.gov/resource/xjya-f8ng.json
# Write code to display parts of the data instead of the entire JSON response!
# Demo:

require "http"
require "json"

# === HTTP request, write to a file
# response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")

# # Cache response to json file
# File.open("employee_data.json", "w") do |file|
#   file.write(response)
# end

# Parse HTTP response
# employee_data = response.parse
# === End HTTP request

# Read json
cached = File.read("employee_data.json")
# pp cached

employee_data = JSON.parse(cached)
pp employee_data

# pp employee_data.length
pp employee_data[0]
# pp employee_data[0]["name"]

employee_data.each do |employee|
  p employee["name"], employee["department"]
end

pp employee_data[0]