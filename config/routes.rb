Rails.application.routes.draw do
  root 'tests#index'  # テスト用記述です。
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }
end
