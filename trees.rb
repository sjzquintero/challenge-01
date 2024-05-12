require 'net/http'
require 'json'
require 'pp'
 
url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
#url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json'
uri = URI(url)
response = Net::HTTP.get(uri)
city_trees = JSON.parse(response) # Convert JSON data into Ruby data.

#trees.each do |tree|
#pp "Tree ID: #{tree['tree_id']}, Common Name: #{tree['common_name']}"
#end

ash_count = 0

city_trees.each do |tree|
        # Check if the common name contains "ash" as a whole word
        if tree['common_name'] =~ /\bAsh\b/i
          ash_count += 1
        end
      end
      
      puts "Total trees with 'ash' in the common name: #{ash_count}"