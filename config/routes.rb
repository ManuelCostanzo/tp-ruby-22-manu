Rails.application.routes.draw do
	
	root to: "lists#index"
	
	post '/' => 'lists#create', as: "lists"
	patch '/:url' => 'lists#update', as: 'list'
	get '/:url' => 'lists#show'
	post '/:url' => 'tasks#create'

  resources :simple, controller: 'tasks', type: 'Simple'
  resources :longs, controller: 'tasks', type: 'Long'
  resources :temporaries, controller: 'tasks', type: 'Temporary'
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
