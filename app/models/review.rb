class Review < ApplicationRecord
  belongs_to :game
  require 'rake_text'

  # def write_file(hash)
  #   CSV.open("data.csv", 'w', headers: hash.keys) do |csv|
  #     csv << hash.values
  #   end
  # end

  # This pair of fuctions gathers all the API data that we need for the searched game. The first function exists to grab the game ID with the search function of the API. The second function takes the game_id and gets the first 100 reviews (called comments) for the game. It then loops through each page, grabbing the actual text comments, until all the reviews are parsed through.

  def self.get_game_id(name)
    response = HTTParty.get('https://boardgamegeek.com/xmlapi2/search?query=' + name + '&type=boardgame&exact=1')
    @game_id = response["items"]['item']['id']
    return response
  end

  def self.get_comments(name)
    get_game_id(name)
    response = HTTParty.get('https://boardgamegeek.com/xmlapi2/thing?&id=' + @game_id + '&ratingcomments=1&pagesize=100&page=1')

    # If every review is desired, uncomment and replace the number with 'pages' (beware: has the potential to be in the hundreds)
    # total_reviews = response['items']['item']['comments']['totalitems']
    # pages = total_reviews.to_i / 100
    text = ""
    5.times do |n|
      review_response = HTTParty.get('https://boardgamegeek.com/xmlapi2/thing?&id=' + @game_id + "&ratingcomments=1&pagesize=100&page=#{n}")
      review_response['items']['item']['comments']['comment'].each do |c|        
        if c["value"] != ""
          text += " #{c['value']}"
        end
      end
    end
    rake = RakeText.new
    keywords = rake.analyse text, RakeText.SMART
    CSV.open("data.csv", 'w') {|csv| keywords.to_a.each {|elem| csv << elem} }
    return response
  end

end