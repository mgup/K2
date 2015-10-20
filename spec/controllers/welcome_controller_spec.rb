require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET-запрос index' do
    it 'выполняется' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'отображает верное представление' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
