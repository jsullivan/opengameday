module BoardGameGeek

  require 'nokogiri'
  require 'open-uri'

  def search_name(game_title)
    game_title = game_title.gsub(" ", "%20")
    uri = "http://boardgamegeek.com/xmlapi/search?search=#{game_title}"
    results = {}
    data = Nokogiri::XML(open(uri))
    data.css('boardgame').each do |game|
      thumbnail = self.get_image_thumbnail(game[:objectid])
      results.merge! game[:objectid].to_i => [game.css('name').text, thumbnail]
    end
    if results.empty?
      raise "No games found."
    else
      return results
    end
  end

  def search_id(game_id)
    uri = "http://boardgamegeek.com/xmlapi/boardgame/#{game_id}"
    result = Nokogiri::XML(open(uri))
    return result
  end

  def get_image_thumbnail(game_id)
    result = self.search_id(game_id)
    thumbnail = result.css('boardgame thumbnail').text
    return thumbnail
  end

end

