Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :accounts

root 'accounts#index'
 Rails.application.routes.draw do
      devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
    end
end