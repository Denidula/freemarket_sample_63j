Rails.application.routes.draw do
root to: "items#index"
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :signup, only: [:index,:create] do
    collection do
      get 'step1'
      post 'step1' => 'signup#step1'
      get 'step2'
      post 'step2' => 'signup#step2'
      get 'step3'
      post 'step3' => 'signup#step3'
      get 'step4'
      post 'step4' => 'signup#step4'
      get 'done'
      post 'done' => 'signup#done'
    end
  end
  
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