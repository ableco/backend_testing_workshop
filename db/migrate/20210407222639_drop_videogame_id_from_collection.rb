class DropVideogameIdFromCollection < ActiveRecord::Migration[6.0]
  def change
    remove_column :collections, :videogame_id
  end
end
