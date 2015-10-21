require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do
  context 'для неавторизованного пользователя' do
    before(:each) do
      expect(subject.current_user).to be_nil
    end

    describe 'GET-запрос index' do
      it 'не должен быть успешным' do
        get :index
        expect(response).not_to have_http_status(:success)
      end

      it 'должен вызывать переход на главную страницу' do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end
  end

  context 'для авторизованного пользователя' do
    let(:user) { FactoryGirl.create(:user) }

    context 'не имеющего права доступа к Подразделениям' do
      before(:each) do
        sign_in(user)
      end

      describe 'GET-запрос index' do
        it 'не должен быть успешным' do
          get :index
          expect(response).not_to have_http_status(:success)
        end

        it 'должен вызывать переход на главную страницу' do
          get :index
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context 'имеющего права доступа к Подразделениям' do
      before(:each) do
        user.has_role!(:developer)
        sign_in(user)
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

        it 'инициализирует список подразделений' do
          skip
        end
      end
    end
  end
end
