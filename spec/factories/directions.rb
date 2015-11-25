FactoryGirl.define do
  factory :direction do
    code { %w(01.03.01 01.04.01 01.05.01 01.06.01).sample }
    name { %w(Математика Физика).sample }
    old_code { %w(010701 010100 010100).sample }
    old_qualification { %w(65 62 68).sample }

    direction_category

    factory :old_direction do
      code nil
    end
  end
end
