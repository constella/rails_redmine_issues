class IssueStatus
	def initialize(status)
		@id = status['id']
		@name = status['name']

  	end

  	def self.get_statuses
  		response = RestClient.get(get_link("issue_statuses.json?include[]=trackers"))
	 	statuses_list = JSON.parse(response.body)
	 	statuses = []
	  	statuses_list["issue_statuses"].each do |status_json|
	  		status= IssueStatus.new(status_json)
	   		statuses << [status.name, status.id]
	 	end
	 	statuses
  	end

  	def id
  		@id
  	end

  	def name
  		@name
  	end

  	def self.get_link(path)
		if path.index("?")==nil
			symbol = "?"
		else
			symbol = "&"
		end
		return "#{IssuesList::DOMAIN}/#{path}#{symbol}key=#{IssuesList::REDMINE_TOKEN}"
	end
end

