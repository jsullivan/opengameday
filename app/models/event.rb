class Event < ActiveRecord::Base

  attr_protected

  validates :game_title, :presence => true

end
