Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :users
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/about'

  get 'simple_pages/contact'

  get 'simple_pages/index'

  post 'simple_pages/thank_you'

  post 'payments/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "simple_pages#landing_page"

  mount ActionCable.server => '/cable'
end