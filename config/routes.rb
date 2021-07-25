Rails.application.routes.draw do



  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :users
  root 'static_page#index'
  get 'static_page/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # devise_scope :user do
  #     # TIPS: ユーザー登録しっぱいのリダイレクトのエラーを防ぐ https://github.com/heartcombo/devise/blob/master/app/controllers/devise/registrations_controller.rb
  #   get '/users', to: 'static_page#index'
  # end

end
