class CreateConcertVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :concert_venues do |t|
      t.integer :concert_id
      t.integer :venue_id
    end 
  end
end
