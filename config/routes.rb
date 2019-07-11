Rails.application.routes.draw do
  # main
  get 'main' => 'main#index'
  get 'main/index'

  # login
  post 'login' => 'login#index'
  get 'login/success/:userName' => 'login#success'
  get 'login/emptyinput'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
