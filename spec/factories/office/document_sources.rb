FactoryGirl.define do
  factory :office_document_source, class: 'Office::DocumentSource' do
    name { Faker::Lorem.sentence }
  end
end
