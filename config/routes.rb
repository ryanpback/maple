Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/',           to: 'greetings#welcome'
  get '/hello',      to: 'greetings#index'
  get 'hello/:name', to: 'greetings#hello'

  resources :urls, only: %i(create)
end
