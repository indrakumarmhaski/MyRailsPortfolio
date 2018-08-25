Rails.application.routes.draw do
  resources :workexample_comments, only: [:create, :destroy]
  resources :workexamples do
    put :sort, on: :collection
  end
  resources :blog_comments, only: [:create, :destroy]
  resources :likes, only: [:create]
  resources :blogs
  devise_for :users
  root to: "pages#home"
  get 'pages/home'
  get 'pages/aboutme'
  get 'pages/contact'
  get 'auth/failure', to: redirect('/')
  get 'auth/:provider/callback', to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
