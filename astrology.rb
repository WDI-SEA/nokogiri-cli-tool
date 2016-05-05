require 'rest-client'
require 'nokogiri'

def whats_your_sign 
  puts "What's your sign?"
  sign = gets.chomp.downcase

  signs = ["aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"]

  if sign != "aries" &&
     sign != "taurus" &&
     sign != "gemini" &&
     sign != "cancer" &&
     sign != "leo" &&
     sign != "virgo" &&
     sign != "libra" &&
     sign != "scorpio" &&
     sign != "sagittarius" &&
     sign != "capricorn" &&
     sign != "aquarius" &&
     sign != "pisces"
    puts "Unfortunately that's not a sign! Try again with a sign!"
    whats_your_sign
  else

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
  end
end

whats_your_sign