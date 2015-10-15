FactoryGirl.define do
  factory :game do
    player_1 { FactoryGirl.create(:user) }
    player_2 { FactoryGirl.create(:user) }
  end
end
