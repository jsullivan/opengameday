class AddBggidToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :bgg_id, :integer
  end

  def self.down
    remove_column :events, :bgg_id
  end
end
