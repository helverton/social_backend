Rails.application.routes.draw do
  scope '/api' do
    scope '/v1', constraints: { format: :json }  do
      
        resources :comments
        resources :posts
        resources :users

        #post '/users.json/:name/:email/:password/:password_confirmation' => 'users#create'
    	
    	put '/posts/:id/curtir' => 'posts#curtir'

        get '/posts/:id/comments' => 'posts#comments'


        get '/login' => 'sessions#new'
        post '/login' => 'sessions#create'
        get '/logout' => 'sessions#destroy'

        get '/signup' => 'users#new'
        post '/users' => 'users#create'
    end
  end
end
