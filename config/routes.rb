Rails.application.routes.draw do
	
	root to: "lists#index"
	
	get '/' => 'lists#index', as: 'lists' 

	post '/' => 'lists#create', as: 'new_list'

	get '/:id' => 'lists#show', as: 'list'

	put '/:id' => 'lists#update',  as: 'edit_list'

	delete '/:id' => 'lists#destroy'

	resources :tasks, :only => [:create, :update, :destroy]

	post 'tasks/:id' => 'tasks#create'
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
