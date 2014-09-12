Rails.application.routes.draw do
  resources :documents
  root to: 'documents#index'
end
