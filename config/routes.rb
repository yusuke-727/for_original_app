Rails.application.routes.draw do
  root 'pages#home' 
  devise_for :users
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
  
end
