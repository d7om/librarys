class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :language
      t.string :isbn
      t.string :version
      t.string :copies
      t.string :pages
      t.string :category
      t.integer :author_id
      t.integer :publisher_id
      t.integer :location_id


      t.timestamps
    end
  end
end
