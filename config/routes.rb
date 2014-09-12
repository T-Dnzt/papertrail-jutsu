Rails.application.routes.draw do
  resources :documents
  resources :sessions, only: [:new, :create] do
    delete 'logout', on: :collection
  end
  root to: 'documents#index'
end
