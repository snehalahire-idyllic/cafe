Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'users/new'

resources :restaurants do
  resources :menus do
		resources :items do
		end
	end
end

resources :users
  root 'restaurants#home'
  get '/signup',  to:'users#new'
 end
