Rails.application.routes.draw do
  resources :documents do
    resources :versions, only: [:destroy] do
      member do
        get :diff, to: 'versions#diff'
        patch :rollback, to: 'versions#rollback'
      end
    end
  end

  resources :sessions, only: [:new, :create] do
    delete 'logout', on: :collection
  end
  root to: 'documents#index'
end
