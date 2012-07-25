class Event < ActiveRecord::Base

  attr_protected

  validates :bgg_id, :presence => true

end
