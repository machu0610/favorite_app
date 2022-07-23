Rails.application.routes.draw do
  root to: 'home#top' #rootパスでhomeに画面遷移
  devise_for :users
  resource :user, except: [:new, :create, :destroy]
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
  end
end
