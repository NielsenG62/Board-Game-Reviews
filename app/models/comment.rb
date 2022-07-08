class Comment < ApplicationRecord

  def initialize(name)
    @name = name
  end

  def get_game_id
    response = HTTParty.get('https://boardgamegeek.com/xmlapi2/search?query=' + @name + '&type=boardgame&exact=1')
    @game_id = response["items"]['item']['id']
    return @game_id
  end

  def get_comments
    get_game_id()
    response = HTTParty.get('https://boardgamegeek.com/xmlapi2/thing?&id=' + @game_id + '&ratingcomments=1&pagesize=100&page=1')
    total_reviews = response['items']['item']['comments']['totalitems']
    pages = total_reviews.to_i / 100
    10.times do |i|
      comment_response = HTTParty.get('https://boardgamegeek.com/xmlapi2/thing?&id=' + @game_id + "&ratingcomments=1&pagesize=100&page=#{i}")
      comment_response['items']['item']['comments']['comment'].each do |c|
        if c["value"] != ""
          p c["value"]
        end
      end
    end
  end
end