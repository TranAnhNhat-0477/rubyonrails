Rails.application.routes.draw do
  get "pages/home"
  resource :session
  resources :passwords, param: :token
  resources :products do
    resources :subscribers, only: [ :create ]
  end

  root "products#index"
  resource :unsubscribe, only: [ :show ]


end
