Rails.application.routes.draw do
  root 'pages#home' 
  devise_for :users
  resources :users
  resources :events

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end
