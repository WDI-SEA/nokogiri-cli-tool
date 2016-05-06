require 'rest-client'
require 'nokogiri'

#define which page we're getting data from




#use the rest client to fetch literal HTML(parsing)



#we downloaded the buzzfeed page and saved it to the folder
# html = File.open('./BuzzFeed.htm')



#define what we're targeting







  def prompt()
    begin
    url = 'http://www.rottentomatoes.com/search/?search='
    entire_movie = "#movie_results_ul li"
    tomato_selector = ".tMeterScore"
    

    title_selector = ".media-body .media-heading a"
    no_rating_selector = ".noRating"
    puts "What movie would you like to search for?"
    movie = gets.chomp
    puts "Getting results..."
    url = url+movie
    

    response = RestClient.get(url)
    html = response.body
    data = Nokogiri::HTML(html)
    elements = data.css(entire_movie)
    elements.each do |element|


      tmeter = element.css(tomato_selector)
      ttitle = element.css(title_selector)
      tnoscore = element.css(no_rating_selector)
      

      if tnoscore.text != "No Score Yet"
      print tmeter.text, " ", ttitle.text
      puts
      end
    end

    puts "Are you done?"
    answer = gets.chomp
   end while answer == "no"
  end

prompt()



