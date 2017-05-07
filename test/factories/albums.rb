FactoryGirl.define do
  factory :album do
    title { Faker::StarWars.character}
    year { Faker::Number.between(1970, 2000) }
    artist
  end
end
