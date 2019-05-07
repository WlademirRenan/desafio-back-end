Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get '/finance' => 'finance#index'
  post '/finance' => 'finance#create'
  #resources :users
  #get    'sign_in'   => 'sessions#new'
  #post   'sign_in'   => 'sessions#create'
  #delete 'sign_out'  => 'sessions#destroy'
end
