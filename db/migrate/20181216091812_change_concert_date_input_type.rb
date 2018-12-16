class ChangeConcertDateInputType < ActiveRecord::Migration[5.2]
  def change
    change_column :concerts, :date, :string
  end
end
