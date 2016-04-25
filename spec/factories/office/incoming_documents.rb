FactoryGirl.define do
  factory :office_incoming_document, class: 'Office::IncomingDocument' do
    number { Faker::Number.number(3) }
    date { Faker::Date.between(1.year.ago, Time.zone.today) }
    title { Faker::Lorem.sentence }

    association :document_type, factory: :office_document_type
  end
end
