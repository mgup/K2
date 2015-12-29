RSpec.shared_examples 'успешный GET-запрос index' do
  context 'GET-запрос index' do
    before do
      get :index
    end

    it 'должен быть успешным' do
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.shared_examples 'не успешный GET-запрос index' do
  context 'GET-запрос index' do
    before do
      get :index
    end

    it 'не должен быть успешным' do
      expect(response).not_to have_http_status(:success)
    end

    it 'должен вызывать переход на главную страницу' do
      expect(response).to redirect_to(root_path)
    end
  end
end
