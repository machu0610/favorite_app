Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/new'
  get 'recipes/show'
  get 'recipes/edit'
  root to: 'home#top' #rootパスでhomeに画面遷移
  devise_for :users
  resource :user, except: [:new, :create, :destroy]
end
