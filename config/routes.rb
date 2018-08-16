Rails.application.routes.draw do
  root to: "pages#home"
  get 'pages/home'
  get 'pages/aboutme'
  get 'pages/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
