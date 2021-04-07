class AddCollectionIdToVideogame < ActiveRecord::Migration[6.0]
  def change
    add_column :videogames, :collection_id, :integer
  end
end
