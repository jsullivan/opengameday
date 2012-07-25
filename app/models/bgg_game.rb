class BggGame
  include ActiveModel::Serialization
  attr_accessor :id,
                :title,
                :thumbnail,
                :image,
                :year_published,
                :description,
                :min_players,
                :max_players,
                :playing_time

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @thumbnail = attributes[:thumbnail]
    @image = attributes[:image]
    @year_published = attributes[:year_published]
    @description = attributes[:description]
    @min_players = attributes[:min_players]
    @max_players = attributes[:max_players]
    @playing_time = attributes[:playing_time]
  end

# persisted is important not to get "undefined method `to_key' for" error
 def persisted?
  false
 end

end
