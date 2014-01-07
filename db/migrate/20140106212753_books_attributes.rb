class BooksAttributes < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.integer :rank, default: 0
    end
  end
end
