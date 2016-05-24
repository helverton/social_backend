Rails.application.routes.draw do
  scope '/api' do
    scope '/v1', constraints: { format: :json }  do
      
        resources :comments
        resources :posts
        resources :posts
        resources :users
    	
    	put '/posts/:id/curtir' => 'posts#curtir'

        get '/posts/:id/comments' => 'posts#comments'
    end
  end
end
