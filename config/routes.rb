Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      # get '/hello_world'    => 'application#hello_world'
    # get '/hello/:name'    => 'application#hello_world'
    root 'application#hello_world'
  resources :posts do
      
    # is the same as:

    # get '/posts'          => 'posts#index'
    # get '/posts/:id'      => 'posts#show'
    # get '/posts/new'	    => 'posts#new'
    # post '/posts'         => 'posts#create'
    # get '/posts/:id/edit' => 'posts#edit'
    # patch '/posts/:id'      => 'posts#update'
    # delete '/posts/:id'   => 'posts#destroy'
    resources :comments, only: [:create, :destroy]
    #is the same as :
    # post '/posts/:id/comments' => 'comments#create'
    # delete 'posts/:post_id/comments/:id' => 'comments#destroy'
  end

  resources :comments, only: :index
  
  # get '/comments'  => 'comments#index'
  

end
