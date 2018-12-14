class ConcertArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :concert_artists do |t|
      t.integer :concert_id
      t.integer :artist_id
    end 
  end
end
