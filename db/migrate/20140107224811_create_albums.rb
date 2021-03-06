class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.text :description
      t.integer :rank, default: 0

      t.timestamps
    end
  end
end
