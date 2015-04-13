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
url_of_data_we_want= "https://api.forecast.io/forecast/39ab5cf3f65c8a1ad56b02964b2713b9/41.78,-87.59"
raw_data= open(url_of_data_we_want).read
parsed_data= JSON.parse(raw_data)

url_data_we_want = "https://maps.googleapis.com/maps/api/geocode/json?address=5807+S+Woodlawn+Ave"
raw_datas=open(url_data_we_want).read
parsed_datas=JSON.parse(raw_datas)

the_temperature=parsed_data["currently"]["temperature"]
the_hour_outlook=parsed_data["hourly"]["summary"]
the_day_outlook=parsed_data["daily"]["summary"]
the_minutely_outlook=parsed_data["minutely"]["summary"]


the_latitude=parsed_datas["results"][0]["geometry"]["location"]["lat"]
the_longitude=parsed_datas["results"][0]["geometry"]["location"]["lng"]

# Ultimately, we want the following line to work when uncommented:

puts "The latitude of #{street_address} is #{the_latitude} and the longitude is #{the_longitude}."
puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next 60 minutes is: #{the_minutely_outlook}"
puts "The outlook for the next hour is: #{the_hour_outlook}"
 puts "The outlook for the next day is: #{the_day_outlook}"
