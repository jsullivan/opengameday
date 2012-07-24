class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :game_title
      t.integer :max_players
      t.datetime :start_time
      t.timestamps
    end
  end
end
