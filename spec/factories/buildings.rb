# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    street_address "123 MyString Street"
    city "MyString"
    state "MA"
    zipcode "02151"
    description "MyText is valid text"
    owner
  end
end
