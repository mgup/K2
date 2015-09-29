namespace :db do
  desc 'Создает с нуля базу данных и заполняет ее тестовыми данными.'
  task reseed: %w(db:drop db:create db:migrate db:seed) do
    puts 'Загружена чистая версия базы данных.'
  end
end
