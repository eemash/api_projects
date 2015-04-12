require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
street_address = gets.chomp
url_safe_street_address = URI.encode(street_address)

# Your code goes below.
url_data_we_want= "https://api.forecast.io/forecast/39ab5cf3f65c8a1ad56b02964b2713b9/41.78,-87.59"
raw_data= open(url_of_data_we_want).read
parsed_data= JSON.parse(raw_data)

the_latitude=parsed_data["latitude"]
the_longitude=parsed_data["longitude"]

# Ultimately, we want the following line to work when uncommented:

puts "The latitude of #{street_address} is #{the_latitude} and the longitude is #{the_longitude}."