#parce que connection est appelée dans self.find
class BaseModel	
	attr_reader :errors

	def new_record?
		@id.blank?
	end


	def save
		return false unless valid?
		if new_record?
			insert
		else
			update
		end
	end

	# a way to get the right table name string
  def self.table_name
    to_s.pluralize.downcase
  end

	def self.connection
	    db_connection = SQLite3::Database.new('db/development.sqlite3')
	    db_connection.results_as_hash = true
	    db_connection
  	end
#parce que connection est aussi appelée dans save
  	def connection
    	self.class.connection
  	end

  def self.all
    # rename all the variables...
    record_hashes = connection.execute("SELECT * FROM #{table_name}")
    	    record_hashes.map do |record_hash|
	    new record_hash
    end
  end

  # we'll define a class method in the Post class that executes the SQL command to return all the posts in a hash, 
    # then we'll use map to create an array of Post objects from that.
    def self.find(id)
	    record_hash = connection.execute("SELECT * FROM #{table_name} WHERE #{table_name}.id = ? LIMIT 1", id).first
	    new record_hash
  	end

  	# used in application#delete_post
	  def destroy
	    connection.execute "DELETE FROM #{self.class.table_name} WHERE #{self.class.table_name}.id = ?", id
	  end
	  

end