
class Issue 
	def initialize(issue)
		name = issue['subject']
		@id = issue['id']
	    @name = name[name.index("]")+1, name.length]
	    @description = issue['description']
	    @created_on = issue['created_on']
	    @tracker = IssueTracker.new(issue['tracker'])
	    @status = IssueStatus.new(issue['status'])
	    if (issue['journals']!=nil)

		    journals = []
			issue['journals'].each do |journal_json|
		    	journal = IssueJournal.new(journal_json)
		    	journals << journal
		    end
		    @journals = journals
		end
	    begin 
	    	@user = User.find(name[4, name.index("]")-1].to_i)
	    rescue ActiveRecord::RecordNotFound
	    	puts 'author issue not found'
	    end

  	end

  	def id
  		@id
  	end

  	def name
  		@name
  	end

  	def description
  		@description
  	end

  	def user
  		@user
  	end

  	def tracker
  		@tracker
  	end

  	def created_on
  		@created_on
  	end

  	def status
  		@status
  	end

  	def journals
  		@journals
  	end
end
