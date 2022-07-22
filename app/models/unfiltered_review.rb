class Review < ApplicationRecord

  # This pair of fuctions gathers all the API data that we need for the searched game. The first function exists to grab the game ID with the search function of the API. The second function takes the game_id and gets the first 100 reviews (called comments) for the game. It then loops through each page, grabbing the actual text comments, until all the reviews are parsed through.

  def self.get_game_id(name)
    response = HTTParty.get('https://boardgamegeek.com/xmlapi2/search?query=' + name + '&type=boardgame&exact=1')
    @game_id = response["items"]['item']['id']
    return response
  end

  def self.get_comments(name)
    get_game_id(name)
    response = HTTParty.get('https://boardgamegeek.com/xmlapi2/thing?&id=' + @game_id + "&ratingcomments=1&pagesize=10&page=1")

    # If a game has more than 500 reviews, only pulls 500, and has the RAKE be a little more strict.
    total_reviews = response['items']['item']['comments']['totalitems']
    pages = total_reviews.to_i / 100
    if pages > 5 
      @times = 5
      @frequency = 2
    else
      @times = pages
      @frequency = 1
    end

    # Makes a big collection of all the reviews for the RAKE
    @all_reviews = ''
    @times.times do |n|
      review_response = HTTParty.get('https://boardgamegeek.com/xmlapi2/thing?&id=' + @game_id + "&ratingcomments=1&pagesize=100&page=#{n}")
      review_response['items']['item']['comments']['comment'].each do |c|        
        if c["value"] != ""
          @all_reviews += " #{c['value']}"
        end
      end
    end
    return @all_reviews
  end


  def self.filter_comments(name)
    rake = RakeText.new
    get_comments(name)

    # Runs the reviews through the RAKE process. result.keywords will produce a hash with the word/phrase and the score it received. A CSV is made for quick readability and in case the data is perferred in that format.
    result = RakeNLP.run(@all_reviews, {
      min_phrase_length: 1,
      max_phrase_length: 3,
      min_frequency:     @frequency,
      min_score:         1,
      stop_list:         RakeNLP::StopList::SMART
    })
    CSV.open("data.csv", "wb") {|csv| result.keywords.to_a.each {|elem| csv << elem} }
  end
end