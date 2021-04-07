json.extract! videogame, :id, :title, :genre, :description, :publisher, :collection, :created_at, :updated_at
json.url videogame_url(videogame, format: :json)
