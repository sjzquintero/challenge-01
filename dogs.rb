require 'net/http'
require 'json'
require 'pp'
 
url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response) # Convert JSON data into Ruby data.
dog_breeds['message'].each do |breed, sub_breeds|
    puts "* #{breed}"
    if sub_breeds.any?
      sub_breeds.each do |sub_breed|
        puts "  * #{sub_breed}"
      end
    end
  end