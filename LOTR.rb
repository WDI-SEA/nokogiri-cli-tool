require 'rest-client'
require 'nokogiri'

def get_tags
  puts "What fandom do you want to find tags for?"
  fandom = gets.chomp.gsub(" ", "%20")
  /The%20Lord%20of%20the%20Rings%20-%20J*d*%20R*d*%20R*d*%20Tolkien/

  #define getting data from - in this case LOTR works' tags from a fanfiction website
  url = "http://archiveofourown.org/tags/#{fandom}"
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

  puts "Want to search for anything else? (yes/no)"
  yes_no = gets.chomp

  if yes_no == "yes" || yes_no == "y"
    get_tags
  else
    puts "Thanks for searching!"
  end
end

get_tags