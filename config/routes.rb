Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    resources 'books'
    resources 'finished_books', only: :index
    resources 'genres'
  end
end
