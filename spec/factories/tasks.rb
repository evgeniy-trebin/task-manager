FactoryGirl.define do
  factory :task do
    user
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    state Task::STATE_NEW
  end
end
