Rails.application.routes.draw do
  #申込みについて
  get 'requests/detail/:id' => 'requests#detail_request'
  get 'request' => 'requests#input_screen'
  post 'requests/create' => 'requests#create'
  get 'requests/index' => 'requests#index_request'
  get 'requests/upload/:id' => 'requests#send_picture'
  post 'requests/upload' => 'requests#upload_picture'

  #撮影者・社員について
  post "workers/logout" => "workers#logout"
  post "workers/create" => "workers#create"
  get "signup_worker" => "workers#new_worker"
  post "workers/:id/update" => "workers#update"
  get "edit_worker/:id" => "workers#edit_worker"
  get "workers/index" => "workers#index_worker"
  get "mypage_worker/:id" => "workers#mypage_worker"

  #ユーザーについて
  get "myphoto/:id" => "users#myphoto"
  post "login" => "users#login"
  get "login" => "users#login_form"
  post "logout" => "users#logout"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  post "users/:id/update" => "users#update"
  get "edit/:id" => "users#edit"
  get "mypage/:id" => "users#mypage"

  get 'lovegraph/top'
  get 'lovegraph/about'
  get 'lovegraph/flow'
  get 'lovegraph/photos'
  get 'lovegraph/photos/detail/:id' => 'lovegraph#detail_photos'
  get 'lovegraph/staffs'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
