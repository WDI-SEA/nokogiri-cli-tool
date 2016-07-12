#Creating a CLI tool with Ruby/Nokogiri

A common task for programmers is to make CLI (command-line interface) tools or scripts for various tasks. Usually, these CLI tools will ask users for input, process the input, and give output. We've been using `rails` and `rake`, which are CLI tools for manging our Rails apps.

To practice data scraping, we're going to create a CLI tool to "acquire" some data from a site.

##Requirements

This is a fairly open-ended assignment. The goal is to create a command line tool that will take some input and return some data from a website. Some suggested sources are below, but you can scrape any site you'd like.

####Suggested sources

* **Horoscope**
    * input: astrological sign
    * output: the horoscope for that sign
    * source: [astrology.com](http://www.astrology.com/)
* **Weather**
    * input: City / Location
    * output: The current weather in that city
    * source: [weather.gov](http://www.weather.gov/)
* **Celebrity Gossip**
    * input: Name of a celebrity
    * output: Headline(s) about that person
    * source: [tmz.com](http://www.tmz.com/)
* **Product Review**
    * input: Name of a product
    * output: The product review / rating
    * source: [cnet.com/reviews](http://www.cnet.com/reviews/)
* **Movie rating**
    * input: Name of a movie
    * output: rotten tomatoes score
    * source: [rottentomatoes.com](http://www.rottentomatoes.com/)

##Suggested Process

* Fork and clone this repository. 
* Go to the site and figure out how you (as a human) would access this data
* Open the console in the browser and use inspect element and `document.querySelector` to find the elements you want to access
* Copy the url and use `curl` to download a test file of data
* Use `nokogiri` to get the data you need from the HTML (using the query selectors you already tested in the browser)
* Use `rest-client` to load a live url
* Use `gets.chomp` or `ARGV` to take input
* Create an alias to make the CLI tool easy to use (optional)



---

## Licensing
1. All content is licensed under a CC-BY-NC-SA 4.0 license.
2. All software code is licensed under GNU GPLv3. For commercial use or alternative licensing, please contact legal@ga.co.
