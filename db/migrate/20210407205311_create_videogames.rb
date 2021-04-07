class CreateVideogames < ActiveRecord::Migration[6.0]
  def change
    create_table :videogames do |t|
      t.string :title
      t.string :genre
      t.string :description
      t.string :publisher

      t.timestamps
    end
  end
end
