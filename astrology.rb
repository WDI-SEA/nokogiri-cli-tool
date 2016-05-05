require 'rest-client'
require 'nokogiri'

#define getting data from - in this case LOTR works' tags from a fanfiction website
url = 'http://www.astrology.com/horoscope/daily/' + sign +  '.html'
puts "fetching data from #{url}"

#request data
response = RestClient.get(url)
html = response.body

#local info
# html = File.open('LOTR.htm')

#give to nokogiri
data = Nokogiri::HTML(html)

#define target
selector = ".page-horoscope-text"

#select data using CSS selector
elements = data.css(selector)

elements.each do |el|
  puts el.text.strip
end

puts "What's your sign?"
sign = gets.chomp