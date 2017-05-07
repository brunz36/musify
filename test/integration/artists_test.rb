require 'test_helper'

class ArtistsTest < ActionDispatch::IntegrationTest
  def test_index_should_return_list_of_artists
    number_of_artists = 3

    number_of_artists.times do
      FactoryGirl.create(:artist)
    end
    # request the index page as json
    get '/artists.json'

    # Ensure it is a success
    assert_equal 200, status

    # Process that body response as json
    json = JSON.parse(response.body)

    # see that we have many artist as we have in db
    assert_equal number_of_artists, json.length
  end

  def test_create_an_artist_add_to_the_db
    post '/artists.json', {
      params: {
        artist: {
          name: "Bob Dylan",
          gender: "male",
          debut_at: 1964,
          number_of_grammies: 10,
          bio: "The folk singer"
        }
      }
    }

    json = JSON.parse(response.body)

    assert_equal 201, status

    assert_equal "Bob Dylan", json["name"]
    assert_equal 10, json["number_of_grammies"]
    assert_equal "The folk singer", json["bio"]
    assert json["albums"]
  end

  def test_cannot_create_artist_without_bio
    # Validation on bio
    post '/artists.json', {
      params: {
        artist: {
          name: "Bob Dylan",
          gender: "male",
          debut_at: 1964,
          number_of_grammies: 10
        }
      }
    }

    json = JSON.parse(response.body)

    assert_equal 422, status
    # Test that there is one error on bio (either one works)
    assert_equal 1, json["bio"].length
    assert_equal ["can't be blank"], json["bio"]
  end

  def test_index_of_artists_with_albums_include_the_albums
    3.times do
      FactoryGirl.create(:artist_with_albums)
    end

    get '/artists.json'

    json = JSON.parse(response.body)

    first_artist = json.first
    assert_not_equal [], first_artist["albums"]
  end
end
