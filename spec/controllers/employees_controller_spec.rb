require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  context 'для неавторизованного пользователя' do
    before(:each) do
      expect(subject.current_user).to be_nil
    end

    it_behaves_like 'не успешный GET-запрос index'
  end

  context 'для авторизованного пользователя' do
    let(:employee) { FactoryGirl.create(:employee) }

    context 'не имеющего права доступа к Сотрудникам' do
      before(:each) do
        sign_in(employee.user)
      end

      it_behaves_like 'не успешный GET-запрос index'
    end

    context 'имеющего права доступа к Сотрудникам' do
      before(:each) do
        employee.positions << FactoryGirl.create(:position_in_otdel_kadrov)
        sign_in(employee.user)
      end

      describe 'GET-запрос index' do
        it 'должен быть успешным' do
          get :index
          expect(response).to have_http_status(:success)
        end

        it 'отображает верное представление' do
          get :index
          expect(response).to render_template(:index)
        end

        it 'инициализирует список сотрудников' do
          get :index
          expect(assigns(:employees)).to eq([employee])
        end
      end
    end
  end
end
