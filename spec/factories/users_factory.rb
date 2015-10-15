FactoryGirl.define do
  factory :user do
    username { FFaker::Name.name }
    password 'foobarbaz'
  end
end
