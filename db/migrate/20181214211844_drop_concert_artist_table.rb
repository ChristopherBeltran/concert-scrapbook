class DropConcertArtistTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :concert_artists
  end
end
