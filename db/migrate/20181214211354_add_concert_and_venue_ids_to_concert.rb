class AddConcertAndVenueIdsToConcert < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :artist_id, :integer
    add_column :concerts, :venue_id, :integer
  end
end
