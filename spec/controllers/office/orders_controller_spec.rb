require 'rails_helper'

RSpec.describe Office::OrdersController, type: :controller do
  let(:document_type) { FactoryGirl.create(:office_document_type) }

  context 'для неавторизованного пользователя' do
    before(:each) do
      expect(subject.current_user).to be_nil
    end

    describe 'GET-запрос index' do
      it 'не должен быть успешным' do
        get :index, document_type_id: document_type.id
        expect(response).not_to have_http_status(:success)
      end

      it 'должен вызывать переход на главную страницу' do
        get :index, document_type_id: document_type.id
        expect(response).to redirect_to(root_path)
      end
    end
  end

  context 'для авторизованного пользователя' do
    let(:user) { FactoryGirl.create(:user) }

    context 'не имеющего права доступа к Приказам' do
      before(:each) do
        sign_in(user)
      end

      describe 'GET-запрос index' do
        it 'не должен быть успешным' do
          get :index, document_type_id: document_type.id
          expect(response).not_to have_http_status(:success)
        end

        it 'должен вызывать переход на главную страницу' do
          get :index, document_type_id: document_type.id
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context 'имеющего права доступа к Приказам' do
      before(:each) do
        user.has_role!(:developer)
        sign_in(user)
      end

      describe 'GET-запрос index' do
        it 'должен быть успешным' do
          get :index, document_type_id: document_type.id
          expect(response).to have_http_status(:success)
        end

        it 'отображает верное представление' do
          get :index, document_type_id: document_type.id
          expect(response).to render_template(:index)
        end

        context 'при запросе списка приказов' do
          it 'инициализирует список приказов' do
            skip
          end

          it 'выводит приказы постранично' do
            skip
          end
        end

        context 'при поиске по ключевым словам', focus: true, search: true do
          let(:order_with_keyword) do
            FactoryGirl.create(:office_order, title: 'keyword1 keyword2')
            Sunspot.commit
          end

          let(:order_without_keyword) do
            FactoryGirl.create(:office_order, title: 'other1 other2')
            Sunspot.commit
          end

          it 'инициализирует список найденными приказами' do
            get :index, document_type_id: document_type.id
            skip
          end
        end
      end
    end
  end
end
