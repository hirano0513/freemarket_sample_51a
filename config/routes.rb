Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
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

  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end

  resources :users, only: [:show, :edit, :update] do
    resources :personals, only: [:show]
  end

  resources :items, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    collection do
      get :search
    end
    
    resources :purchase, only: [:index] do
      collection do
        get 'index', to: 'purchase#index'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'items#index'
end
