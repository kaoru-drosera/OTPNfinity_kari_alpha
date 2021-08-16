Rails.application.routes.draw do



  get 'sefile/show'
  get 'sampler/save'
  # get 'sampler/seindex'
  get 'sampler/index'
  # ↓「ホーム画面から投稿がしたい」という時は
  # post元を「/」にする。
  post '/' => 'sampler#submit'
  # …とはいえ、基本「ホーム画面からXXしたい」という時は
  # ↓ こんな感じで書いた方が無難かもしれない。
  get '/' => 'sampler#index'
  get 'sampler/show'
  resources :samplers, only: [:index, :save, :submit, :show]
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
