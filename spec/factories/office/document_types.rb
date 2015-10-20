FactoryGirl.define do
  factory :office_document_type, class: Office::DocumentType do
    prefix '01-03р'
    name Faker::Lorem.sentence
  end
end
