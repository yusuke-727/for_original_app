Rails.application.routes.draw do
  root 'pages#home' 
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
 
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

  resources :users
  resources :events do
    member do
      get 'answer' 
      patch 'submit_answer'
    end
  end

  namespace :admin do
    resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy] 
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

end
