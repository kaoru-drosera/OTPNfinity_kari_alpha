Rails.application.routes.draw do

  root 'static_page#index'
  get 'static_page/index'


  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :users


  # get 'sampler/index'
  # 基本「ホーム画面からXXしたい」という時は
  # ↓ こんな感じで書いた方が無難かもしれない。
  get '/' => 'sampler#index'
  resources :samplers, only: [:save, :index, :submit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # devise_scope :user do
  #     # TIPS: ユーザー登録しっぱいのリダイレクトのエラーを防ぐ https://github.com/heartcombo/devise/blob/master/app/controllers/devise/registrations_controller.rb
  #   get '/users', to: 'static_page#index'
  # end

  # ↓「ホーム画面から投稿がしたい」という時は
  # post元を「/」にする。
  post '/' => 'sampler#submit'
  get 'sampler/save'
  get 'sefile/show'

end
