require 'rails_helper'

RSpec.describe Direction, type: :model do
  describe 'являющееся частью современного стандарта' do
    let(:direction) { FactoryGirl.create(:direction) }

    it 'имеет современный формат кода' do
      expect(direction.full_code).to match(/\d{2}\.0[3,4,5,6]\.\d{2}/)
    end
  end

  describe 'являющееся частью старого стандарта' do
    let(:old_direction) { FactoryGirl.create(:old_direction) }

    it 'имеет старый формат кода' do
      expect(old_direction.full_code).to match(/\d{6}\.[65,62,68]/)
    end
  end

  describe 'любое без ограничений' do
    let(:direction) { FactoryGirl.create(:direction) }

    it 'имеет полное название, включающее в себя код направления' do
      expect(direction.full_name).to include(direction.full_code)
    end

    it 'имеет полное название, включающее в себя название направления' do
      expect(direction.full_name).to include(direction.name)
    end
  end

  describe 'используемое в контексте класса' do
    context 'при запросе и современных и старых направлений' do
      before(:each) do
        @d1 = FactoryGirl.create(:direction, name: 'a')
        @d2 = FactoryGirl.create(:direction, name: 'b', code: '00.03.01')
        @d3 = FactoryGirl.create(:direction, name: 'b', code: '00.04.01')
        @d4 = FactoryGirl.create(:old_direction, name: 'b',
                                                 old_code: '000000.62')
        @d5 = FactoryGirl.create(:old_direction, name: 'b',
                                                 old_code: '000000.68')
      end

      it 'должно выдавать все направления' do
        expect(Direction.with_old).to include(@d1, @d2, @d3, @d4, @d5)
      end

      it 'должно выдавать все направления с сортировкой по названию, коду '\
         'и старому коду' do
        expect(Direction.with_old).to eq([@d1, @d4, @d5, @d2, @d3])
      end
    end
  end
end
