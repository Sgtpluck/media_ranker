class CreatingMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.text :description
      t.integer :rank, default: 0
    end
  end
end
