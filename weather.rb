require 'rest-client'
require 'nokogiri'


#define what page we're getting data from
url = 'http://www.ewg.org/tap-water/rating-big-city-water.php'
puts "fetching data from #{url}"

#use the rest client to fetch literal HTML
# response = RestClient.get(url)
# html = response.body

html = File.open('./water.html')

#define what we're targeting
selector =".nounderline"


data = Nokogiri::HTML(html)

elements = data.css(selector)
elements.each do |el|
  puts el.text.strip
end

puts "Enter a Location: "

answer =gets.chomp