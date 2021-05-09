Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/pages/test' =>'pages#test'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: [ :delete ] do
    resources :events, except: [ :index ]
    resources :reviews, except: [ :index ] do
      resources :comments, except: [ :index ]
    end
    resources :comments, only: [ :index ]
  end

  #get '/users/:id/edit_schedule' =>'users#edit_schedule', as: :edit_schedule
  #patch '/users/:id/edit_schedule'=>'users#edit_schedule'

  resources :reviews, only: [ :index ]
  resources :events, only: [ :index ]
  # resources :comments, only: [ :index ]

end
