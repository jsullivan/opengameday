module BoardGameGeek

  def search_name(game_title)
    game_title = game_title.gsub(" ", "%20")
    uri = "http://boardgamegeek.com/xmlapi/search?search=#{game_title}"
    results = {}
    data = Nokogiri::XML(open(uri))
    data.css('boardgame').each do |game|
      results.merge! game[:objectid].to_i => game.css('name').text
    end
    if results.empty?
      raise "No games found."
    else
      return results
    end
  end

end

