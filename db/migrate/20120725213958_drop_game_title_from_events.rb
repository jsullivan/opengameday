class DropGameTitleFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :game_title
  end

  def down
    add_column :events, :game_title, :string
  end
end
