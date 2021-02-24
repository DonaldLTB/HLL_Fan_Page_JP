Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: [ :delete ] do
    resources :events, only: [ :new, :create ]
    resources :reviews, only: [ :new, :create ]
  end

  get '/users/:id/edit_schedule' =>'users#edit_schedule', as: :edit_schedule
  patch '/users/:id/edit_schedule'=>'users#edit_schedule'

end
