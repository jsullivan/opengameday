class BggApi

  require 'nokogiri'
  require 'open-uri'

  def self.search_name(game_title)
    game_title = game_title.gsub(" ", "%20")
    uri = "http://boardgamegeek.com/xmlapi2/search?type=boardgame&query=#{game_title}"
    results = []
    data = Nokogiri::XML(open(uri))
    data.xpath('//items/item').each do |item|
      game = self.search_id(item['id'])
      results << game unless game.nil?
    end
    if results.empty?
      return "none"
    else
      return results
    end
  end

  def self.search_id(game_id)
    uri = "http://boardgamegeek.com/xmlapi2/thing?type=boardgame&id=#{game_id}"
    result = Nokogiri::XML(open(uri))
    
    #Build BggGame from search results
    if result.xpath('//items').children.count > 0 && result.xpath('//items/item').attribute('type').text == "boardgame"
      game = BggGame.new(:id => game_id)
      game.thumbnail = result.xpath('//items/item/thumbnail').text
      game.image = result.xpath('//items/item/image').text
      game.title = result.xpath('//items/item/name[@type = primary]')
      game.description = result.xpath('//items/item/description').text
      game.year_published = result.xpath('//items/item/yearpublished').attribute('value').text
      game.min_players = result.xpath('//items/item/minplayers').attribute('value').text
      game.max_players = result.xpath('//items/item/maxplayers').attribute('value').text
      game.playing_time = result.xpath('//items/item/playingtime').attribute('value').text
      result.xpath("//items/item/name").each do |name|
        if name[:type] == "primary"
          game.title = name[:value]
        end
      end
      return game
    end
  end

  def self.get_image_thumbnail(game_id)
    result = self.search_id(game_id)
    thumbnail = result.css('boardgame thumbnail').text
    return thumbnail
  end
  def self.testit
    return "hello"
  end
end

