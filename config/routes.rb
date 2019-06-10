Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                registrations: 'users/registrations', sessions: 'users/sessions'}

  devise_scope :user do
    get 'users/sign_up/index', to: 'users/registrations#index'
    get 'users/log_out', to: 'users/sessions#log_out'
    get 'users/sms_auth', to: 'users/registrations#sms_auth'
    get 'users/address', to: 'users/registrations#address'
    get 'users/payment', to: 'users/registrations#payment'
    get 'users/registered', to: 'users/registrations#registered'
  end

  resources :credit_cards, only: [:new, :create, :edit]

  resources :users, only: [:show, :edit, :update] do
    resources :personals, only: [:show]
  end

  resources :items, only: [:index, :new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'items#index'
end
