require 'rest-client'
require 'nokogiri'

#define getting data from - in this case LOTR works' tags from a fanfiction website
url = 'http://archiveofourown.org/tags/The%20Lord%20of%20the%20Rings%20-%20J*d*%20R*d*%20R*d*%20Tolkien/works'
puts "fetching data from #{url}"

#request data
response = RestClient.get(url)
html = response.body

#local info
# html = File.open('LOTR.htm')

#give to nokogiri
data = Nokogiri::HTML(html)

#define target
selector = "ul.tags.commas"

#select data using CSS selector
elements = data.css(selector)

elements.each do |el|
  puts el.text.strip
end
