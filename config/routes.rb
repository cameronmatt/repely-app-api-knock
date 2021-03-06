Rails.application.routes.draw do
  resources :tickets do 
    resources :comments
  end
  post 'user_token' => 'user_token#create'
  resources :users
  get 'userauth' => 'home#auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope '/auth' do
    post '/signin', to: 'user_token#create'
    post '/signup', to: 'users#create'
   end
end
