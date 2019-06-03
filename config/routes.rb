Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                 registrations: 'users/registrations', sessions: 'users/sessions'}

  devise_scope :user do
    get 'users/sign_up/index', to: 'users/registrations#index'
    get 'log_out', to: 'users/sessions#log_out'
    get 'users/sms_auth', to: 'users/registrations#sms_auth'
    get 'users/address', to: 'users/registrations#address'
    get 'users/payment', to: 'users/registrations#payment'
    get 'users/registered', to: 'users/registrations#registered'
  end

  resources :personals, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'items#index'
end
