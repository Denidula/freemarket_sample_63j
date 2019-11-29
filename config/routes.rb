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

  namespace :transaction do
    get 'buy'
  end


  
  resources :items
  post 'items/upload_image', to: 'items#upload_image'
  
end