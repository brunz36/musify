json.extract! artist, :id, :name, :gender, :debut_at, :number_of_grammies, :bio, :created_at, :updated_at
json.url artist_url(artist, format: :json)
json.albums artist.albums
