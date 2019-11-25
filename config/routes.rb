Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do 
    get 'users/sign_up/register' => 'users/registrations#register'
  end
  
  namespace :mypage do
    get 'index'
    get 'notification'
    get 'profile'
  end

  namespace :transaction do
    get 'buy'
  end
  
  resources :items
  
end
