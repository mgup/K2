require 'rails_helper'

RSpec.describe Department, type: :model do
  it 'должно параметризоваться с учётом имени' do
    department = FactoryGirl.create(:department, id: 1, name: 'Мой департамент')
    expect(department.to_param).to eq(
      "1-#{Russian.translit('мой')}-#{Russian.translit('департамент')}"
    )
  end
end
