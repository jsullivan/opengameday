ActiveAdmin.register Event do

  form do |f|
    f.inputs "Details" do
      f.input :bgg_id
      f.input :start_time
      f.input :max_players
      f.buttons
    end
  end
end
