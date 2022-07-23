Rails.application.routes.draw do
  get 'users/show'
  root to: 'home#top' #rootパスでhomeに画面遷移
  devise_for :users
end
