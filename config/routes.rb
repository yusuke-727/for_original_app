Rails.application.routes.draw do
  root 'events#index'
  resources :events

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end
