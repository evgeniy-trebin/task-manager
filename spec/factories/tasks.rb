FactoryGirl.define do
  factory :task do
    user
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }

    factory :started_task do
      after(:create) do |task|
        task.start
      end
    end

    factory :finished_task do
      after(:create) do |task|
        task.start
        task.finish
      end
    end
  end
end
