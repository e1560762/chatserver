Rails.application.routes.draw do
  	root 'welcome#index'

  	#room
  	get 'room/index', to: 'room#index'
  	get 'room/new', to: 'room#new'
  	post 'room/create', to: 'room#create'
  	get 'room/chat/:id', to: 'room#chat'
  	get 'room/enter', to: 'room#enter'

  	#user
  	get 'user/index', to: 'user#index'
  	get 'user/new', to: 'user#new'
  	post 'user/create', to: 'user#create'
  	get 'user/login', to: 'user#login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
