FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { person.first.kanji }
    last_name             { person.last.kanji }
    first_name_kana       { person.first.katakana }
    last_name_kana        { person.last.katakana }
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
