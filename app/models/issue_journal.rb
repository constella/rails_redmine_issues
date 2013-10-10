class IssueJournal
	def initialize(journal)
		name = journal['notes']
		if name.index("]")!=nil 
			@notes = name[name.index("]")+1, name.length]
			begin 
		    	@user = User.find(name[4, name.index("]")-1].to_i)
		    rescue ActiveRecord::RecordNotFound
		    	puts 'author issue not found'
		    end
		else
			if name==""
				@notes = nil
			else
				@notes = name
			end
			@user = nil
		end
		@created_on = journal['created_on']
	    

  	end

	def id
  		@id
  	end

  	def notes
  		@notes
  	end

  	def user
  		@user
  	end

  	def created_on
  		@created_on
  	end
end
