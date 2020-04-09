class ApplicationController < ActionController::Base
	# skip_before_action :verify_authenticity_token
   # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def hello_world
		#name = params['name'] || "World!"
	
    #render 'application/hello_world', locals: {name: name}
	end

	def list_posts
	    
  end

	def show_post
    
      
	end

	
  	def new_post
      
  	end

  	def create_post
  		
  	end

  	def edit_post
  		
  	end

  	def update_post
  		
  	end

# And after using Post.find in the show_post action, we're also able to get rid of our find_post_by_id method from the controller entirely, 
# since we're now exclusively using our new Post.find method for this purpose.

  	def delete_post
	    
  	end

  def list_comments
    
    
  end

  def create_comment
    
  end

  def delete_comment
    
  end

end
