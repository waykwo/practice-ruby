def http_get_json_write_to_file(url, file_name)
  response = HTTP.get(url)

  # Cache response to json file
  File.open(file_name, "w") do |file|
    file.write(response)
  end

  Parse HTTP response
  file_name = response.parse
end