Rails.application.routes.draw do
root to: "items#index"
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  namespace :logout do
    get 'index'
  end

  namespace :mypage do
    get 'index'
    get 'notification'
    get 'profile'
    get 'card'
    get 'identification'
  end

  namespace :transaction do
    get 'buy'
  end


  
  resources :items
  
end