class DropConcertVenueTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :concert_venues
  end
end
