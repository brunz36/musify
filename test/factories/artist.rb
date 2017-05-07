FactoryGirl.define do

  factory :artist do
    name { Faker::StarWars.character }
    gender "male"
    debut_at { Faker::Date.between(40.years.ago, 5.years.ago) }
    number_of_grammies { Faker::Number.between(0,20) }
    bio { Faker::StarWars.quote }
  end
end
