require 'rest-client'
require 'Nokogiri'

puts "what's your sign?"
sign = gets.chomp

url = "http://www.astrology.com/horoscope/daily/"+ sign + ".html"
puts "fetching data from #{url}"

response = RestClient.get(url)
html = response.body

data = Nokogiri::HTML(html)
@horoscope_selector = ".page-horoscope-text"

def get_els(data, selector)
  elements = data.css(@horoscope_selector)
  elements.each do |ho|
  puts ho.text.strip
  
  end
end

get_els(data, @horoscope_selector)

