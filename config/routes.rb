Rails.application.routes.draw do
  # main
  get 'main' => 'main#index'
  get 'main/index'

  # login
  post 'login' => 'login#index'
 
  # user
  get 'user_login' => 'user_login#index'

  # admin
  get 'admin_login' => 'admin_login#index'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
