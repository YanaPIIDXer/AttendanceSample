Rails.application.routes.draw do
  # main
  get 'main' => 'main#index'
  get 'back_to_top' => 'back_to_top#logout'
  get 'error' => 'error#index'

  # user
  get 'user_login' => 'user_login#index'
  post 'user_check' => 'user_check#index'
  get 'user_main' => 'user_main#index'
  post 'work_time/attendance'
  post 'work_time/leave'

  # admin
  get 'admin_login' => 'admin_login#index'
  post 'admin_check' => 'admin_check#index'
  get 'admin_main' => 'admin_main#index'
  get 'salary_manage' => 'salary_manage#index'
  post 'salary_manage' => 'salary_manage#create'
  post 'salary_manage/delete'
  get 'user_manage' => 'user_manage#index'
  post 'user_manage/create'
  post 'user_manage/change'
  post 'user_manage/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
