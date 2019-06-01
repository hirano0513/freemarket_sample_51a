Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                 registrations: 'users/registrations', sessions: 'users/sessions'}

  devise_scope :user do
    get 'users/sign_up/index' => 'users/registrations#index'
  end

  resources :personals, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'items#index'
end
