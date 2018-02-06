Rails.application.routes.draw do
  #申込みについて
  get 'requests/detail/:id', to: 'requests#detail_request'
  get 'request', to: 'requests#input_screen'
  post 'requests/create', to: 'requests#create'
  get 'requests/index', to: 'requests#index_request'
  get 'requests/upload/:id', to: 'requests#send_pictures'
  post 'requests/:id/upload', to: 'requests#upload'
  post '/request/cancel/:id', to: 'requests#cancel'

  #撮影者・社員について
  post "workers/logout", to: "workers#logout"
  post "workers/create", to: "workers#create"
  get "signup_worker", to: "workers#new_worker"
  post "workers/:id/update", to: "workers#update"
  get "edit_worker/:id", to: "workers#edit_worker"
  get "workers/index", to: "workers#index_worker"
  get "mypage_worker/:id", to: "workers#mypage_worker"

  #ユーザーについて
  get "myphoto/:id", to: "users#myphoto"
  post "login", to: "users#login"
  get "login", to: "users#login_form"
  post "logout", to: "users#logout"
  post "users/create", to: "users#create"
  get "signup", to: "users#new"
  post "users/:id/update", to: "users#update"
  get "edit/:id", to: "users#edit"
  get "mypage/:id", to: "users#mypage"

  get 'lovegraph/top'
  get 'lovegraph/about'
  get 'lovegraph/flow'
  get 'lovegraph/photos'
  get 'lovegraph/photos/detail/:id', to: 'lovegraph#detail_photos'
  get 'lovegraph/staffs'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
