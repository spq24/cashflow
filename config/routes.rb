Rails.application.routes.draw do

	namespace :api, defaults: { format: :json } do
		resources :categories do
			resources :sub_categories
		end
		
		resources :users do
			resources :categories
			resources :sub_categories
			resources :transactions
		end

		resources :sub_categories
		resources :transactions
	end

	resources :categories do
		resources :sub_categories
	end
	
	resources :users do
		resources :categories
		resources :sub_categories
		resources :transactions
	end
	
	resources :sub_categories
		resources :transactions
		
	devise_for :users

end
