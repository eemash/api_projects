require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

url_of_data_we_want="https://api.forecast.io/forecast/39ab5cf3f65c8a1ad56b02964b2713b9/41.7890569,-87.5955604"
raw_data = open(url_of_data_we_want).read
parsed_data = JSON.parse(raw_data)



the_temperature=parsed_data["currently"]["temperature"]
the_hour_outlook=parsed_data["hourly"]["summary"]
the_day_outlook=parsed_data["daily"]["summary"]
the_minutely_outlook=parsed_data["minutely"]["summary"]
# Your code goes below. Use the same approach as you did in
#   address_to_coords.rb to read from a remote API and parse
#   the results.

# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next 60 minutes is: #{the_minutely_outlook}"
puts "The outlook for the next hour is: #{the_hour_outlook}"
 puts "The outlook for the next day is: #{the_day_outlook}"
