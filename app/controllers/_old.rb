class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
	
	def hello_world
		name = params['name'] || "World!"
		render 'application/hello_world', locals: {name: name}
	end

	def list_posts
    	posts = connection.execute("SELECT * FROM posts")
    	render 'application/list_posts', locals: { posts: posts }
	end

	def show_post
    	post =  post = find_post_by_id(params['id'])
    	render 'application/show_post', locals: { post: post }
	end

	def connection
	    db_connection = SQLite3::Database.new 'db/development.sqlite3'
	    db_connection.results_as_hash = true
	    db_connection
  	end

  	def new_post
  		render 'application/new_post'
  	end

  	def create_post
# The first thing we do in create_post is execute some SQL to INSERT the new post into the posts table. Since our SQL query string is multiline, we define it using a heredoc (the <<-SQL ... SQL syntax above), 
# 	and inside we see four ?s for the values of our four post attributes
	    insert_query = <<-SQL
	      INSERT INTO posts (title, body, author, created_at)
	      VALUES (?, ?, ?, ?)
	    SQL
# Then we see those four values passed in as arguments to connection.execute, following the query argument. We also see that we get these values out of params, as in params['title']. 
# These values make their way into params based on the name attributes of the <input>s in our new_post <form>.
	    connection.execute insert_query,
	      params['title'],
	      params['body'],
	      params['author'],
	      Date.current.to_s
# Then, with our new post successfully added to the database, 
# we simply respond to the client by redirecting them back to the list of posts. Since the new post is now a row in the posts table, list_posts will include its title when it renders.
	    redirect_to '/list_posts'
			    # require 'pry'; binding.pry;
			    # response.body
				# => "<html><body>You are being <a href=\"http://localhost:3000/list_posts\">redirected</a>.</body></html>"
				# response.content_type # => nil
				# response.status #  => 302
				# response.headers
				# # => {
				# #      # ...
				# #      "Location"=>"http://localhost:3000/list_posts"
				# #    }
				# response.headers['Location']
				# # => "http://localhost:3000/list_posts"
  	end

  	def edit_post
  		post =  post = find_post_by_id(params['id'])

    	render 'application/edit_post', locals: { post: post }
  	end

  	def update_post
	    update_query = <<-SQL
	      UPDATE posts
	      SET title      = ?,
	          body       = ?,
	          author     = ?
	      WHERE posts.id = ?
	    SQL
	    connection.execute update_query, params['title'], params['body'], params['author'], params['id']

	    redirect_to '/list_posts'
  	end

  	def find_post_by_id(id)
    	connection.execute("SELECT * FROM posts WHERE posts.id = ? LIMIT 1", id).first
  	end

  	def delete_post
  		connection.execute("DELETE FROM posts WHERE posts.id = ?", params['id'])
    	redirect_to '/list_posts'
  	end




end
