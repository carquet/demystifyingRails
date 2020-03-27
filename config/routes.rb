Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hello_world' => 'application#hello_world'
  get '/hello/:name' => 'application#hello_world'
  get '/list_posts'  => 'application#list_posts'
  get '/show_post/:id'   => 'application#show_post'
  get '/new_post'	=> 'application#new_post'
  post '/create_post' => 'application#create_post'
  get '/edit_post/:id' => 'application#edit_post'
  post '/update_post/:id' => 'application#update_post'
  post '/delete_post/:id' => 'application#delete_post'
  post '/create_comment_for_post/:post_id' => 'application#create_comment'
  get '/list_comments' => 'application#list_comments'

end
