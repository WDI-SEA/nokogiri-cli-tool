require 'rest-client'
require 'nokogiri'

@signs = ["aries", "taurus", "gemini",
         "cancer", "leo", "virgo", 
        "libra", "scorpio","sagittarius",
        "capricorn", "aquarius","pisces"]

@needs_correction = false

def question
  if ARGV.length > 0 and not @needs_correction
    sign = ARGV[0]
  else
    puts "What is your sign?"
    sign = gets.chomp.downcase  
  end

  if @signs.include? sign
    call(sign)

  else
    @needs_correction = true
    puts "You must pick a valid sign"
    question()
  end
end



def call(sign)
  url = 'http://www.astrology.com/horoscope/daily/' + sign + '.html'

  response = RestClient.get(url)
  html = response.body


  data = Nokogiri::HTML(html)
  text = data.css('.page-horoscope-text').text
  puts text
end

question