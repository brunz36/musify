FactoryGirl.define do

  factory :artist do
    name { Faker::StarWars.character }
    gender "male"
    debut_at { Faker::Date.between(40.years.ago, 5.years.ago) }
    number_of_grammies { Faker::Number.between(0,20) }
    bio { Faker::StarWars.quote }

    transient do
      album_count 3
    end

    factory :artist_with_albums do
      after(:create) do |artist, evaluator|
        evaluator.album_count.times do
          artist.albums << build(:album)
        end
      end
    end

  end
end
