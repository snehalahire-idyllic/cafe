Rails.application.routes.draw do
  get 'users/new'

resources :restaurants do
  resources :menus do
		resources :items do
		end
	end
end
  root 'restaurants#home'
  get '/signup',  to:'users#new'
 end
