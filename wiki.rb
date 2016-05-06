require 'rest-client'
require 'nokogiri'

def get_dem_links 
  puts "What are we looking for?"
  q = gets.chomp.downcase.tr(" ", "_")
  puts "#{q}"

  #define getting data from - in this case LOTR works' tags from a fanfiction website
  url = "https://en.wikipedia.org/wiki/#{q}"
  puts "fetching data from #{url}"

  #request data
  response = RestClient.get(url)
  html = response.body

  #local info
  # html = File.open('LOTR.htm')

  #give to nokogiri
  data = Nokogiri::HTML(html)

  #define target
  selector = "p a"

  #select data using CSS selector
  elements = data.css(selector)

  elements.each do |el|
    puts el.text.strip
  end

  puts "Want to search for anything else? (yes/no)"
  yes_no = gets.chomp

  if yes_no == "yes" || yes_no == "y"
    get_dem_links
  else
    puts "Thanks for searching!"
  end
end

get_dem_links