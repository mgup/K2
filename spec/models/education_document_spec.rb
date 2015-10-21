require 'rails_helper'

RSpec.describe EducationDocument, type: :model do
  it 'должен иметь возможность быть связаным со старыми специальностями' do
    direction = FactoryGirl.create(:old_direction)

    document = FactoryGirl.create(:education_document,
                                  direction_id: direction.id)
    expect(document.direction).to eq(direction)
  end
end
