require 'rest-client'
require 'nokogiri'

#define what page we're getting data from
def verify_sign input
	signs = ["aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"]
	match = false
	signs.each do |sign|
		if input == sign
			match = true
		end
	end
	return match
end

def verify_bday str
	return /(0?[1-9]|1[0-2])\/(0?[1-9]|[12][0-9]|3[01])/.match(str)
end

def sign_bday str
	split = str.split('/')

	month = split[0].to_i
	day = split[1].to_i

	#print split
	#puts

	#puts month
	#puts day

	if ((month == 3 && day >= 21) || (month == 4 && day <= 19))
		sign = "aries"
	elsif ((month == 4 && day >= 20) || (month == 5 && day <= 20))
		sign = "taurus"
	elsif ((month == 5 && day >= 21) || (month == 6 && day <= 20))
		sign = "gemini"
	elsif ((month == 6 && day >= 21) || (month == 7 && day <= 22))
		sign = "cancer"
	elsif ((month == 7 && day >= 23) || (month == 8 && day <= 22))
		sign = "leo"
	elsif ((month == 8 && day >= 23) || (month == 9 && day <= 22))
		sign = "virgo"
	elsif ((month == 9 && day >= 23) || (month == 10 && day <= 22))
		sign = "libra"
	elsif ((month == 10 && day >= 23) || (month == 11 && day <= 21))
		sign = "scorpio"
	elsif ((month == 11 && day >= 22) || (month == 12 && day <= 21))
		sign = "sagittarius"
	elsif ((month == 12 && day >= 22) || (month == 1 && day <= 19))
		sign = "capricorn"
	elsif ((month == 1 && day >= 20) || (month == 2 && day <= 18))
		sign = "aquarius"
	elsif ((month == 2 && day >= 19) || (month == 3 && day <= 20))
		sign = "pisces"	
	else
		sign = "unknown"
	end

	return sign
end

input = "unknown"

until verify_sign(input) do
	puts "What's your sign? If you don't know, what's your birthday? (mm/dd)"
	if verify_bday(input)
		converted_sign = sign_bday(input)
		# puts converted_sign
		input = converted_sign
	else
		input = gets.chomp.downcase
	end
end

url = "http://www.astrology.com/horoscope/daily/" + input + ".html"

puts url

# use the rest client to fetch literal HTML
response = RestClient.get(url)
html = response.body

# define what we're targeting
selector = "div.page-horoscope-text"

data = Nokogiri::HTML(html)
horoscope = data.css(selector)

puts "Horoscope for " + input.capitalize + ":"
puts horoscope.text
