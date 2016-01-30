include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :attach_file do
    task
    name { Faker::Lorem.sentence }
    file { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files','test.txt')) }
  end
end
