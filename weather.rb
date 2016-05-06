require 'rest-client'
require 'nokogiri'

# 1. Decide what text/images we want to scrape
  # a. Pick a webpage
# 1. Request a webpage (using rest-client + url)
# 2. 


# url = 'http://buzzfeed.com'
puts "enter location"
query = gets.chomp.gsub (/ /, '+')
puts query
url = 'http://www.intellicast.com/Local/Default.aspx?query=#{query}'
url2 = 'http://www.intellicast.com/Local/Weather.aspx?location=USWA0441'
puts "Fetching data from #{url}..."

# response = RestClient.get(url)
# html = response.body
html = File.open('./googleweather.html')

# selector = ".grid-posts h2 .lede__link"
# selector = '.TrackName'
selector = '#results a'
selector2 = '#conditions_view .Charcoal a'

data = Nokogiri::HTML(html)
search_links = data.css(selector)
if search_links
  url2 = searchlinks[0].href
  puts url2
  html2 = RestClient.get(url2)
  data = Nokogiri::HTML(html2)
end

temperature = data.css(selector2)

elements.each do |headline_links|
  puts headline_links.text.strip
end