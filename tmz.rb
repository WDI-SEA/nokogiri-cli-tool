# require gems
require 'rest-client'
require 'nokogiri'

request = gets.chomp 


# use the rest client to fetch literal html
url = "http://www.astrology.com/horoscope/daily/#{request}.html"
puts = 'fetching data from #{url}'

response = RestClient.get(url)
html = response.body

data = Nokogiri::HTML(html)

elements = data.css(".page-horoscope-text")
elements.each do |element|
	puts element.text
end


