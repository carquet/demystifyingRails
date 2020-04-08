class PostsController < ApplicationController

	before_action :find_post, only: [:show, :edit,:update, :destroy ]
	def index
		@posts = Post.all

	  # render 'index'
	end

	def show
		#@post    = Post.find(params['id'])
    @comment = Comment.new
    # @comments = @post.comments 
	end

	def new
		@post = Post.new

	end


	def create
		@post = Post.new('title' => params[:title],
                    'body' => params[:body],
                    'author' => params[:author])
	    if @post.save
	     redirect_to posts_path #(which will give us the posts index and list them)
      else
        render 'new' #have to rename the html to remove this
      end
	end

	def edit
		#@post = Post.find(params['id'])


	end

	def update

		#@post = Post.find(params['id'])
  	@post.set_attributes('title' => params[:title], 'body' => params[:body], 'author' => params[:author])
  		
  		if @post.save
	     redirect_to posts_path 
     	else

      	render 'edit' 
      end
	end

	def destroy
		# post = Post.find(params['id'])
	    @post.destroy

	    redirect_to posts_path
	end
private 

def find_post
	@post = Post.find(params[:id])
	
end

end