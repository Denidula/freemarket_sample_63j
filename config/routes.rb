Rails.application.routes.draw do
  root to: "items#index"

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :signup, only: [:index,:create] do
    collection do
      get 'input_user_info'
      post 'input_user_info' => 'signup#input_user_info'
      get 'input_phone_number'
      post 'input_phone_number' => 'signup#input_phone_number'
      get 'input_address'
      post 'input_address' => 'signup#input_address'
      get 'input_credit_card'
      post 'input_credit_card' => 'signup#input_credit_card'
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

  resources :items do
    collection do
      get  'purchase/:id' => 'items#purchase', as: 'purchase'
      post 'pay/:id'      => 'items#pay',      as: 'pay'
      get  'done'         => 'items#done',     as: 'done'
    end
  end

  resources :credit_card, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_card#show'
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end

end