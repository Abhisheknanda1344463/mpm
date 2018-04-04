Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resource :invitations
resources :accounts do 
      resources :teams
end
 
post 'invitations/get_email'
post 'teams/get_user'
get 'check' => 'invitations#check_user'

  root 'accounts#index'
      devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
end
