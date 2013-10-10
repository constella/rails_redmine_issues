class IssueTracker
	def initialize(tracker)
		@id = tracker['id']
		@name = tracker['name']

  	end

  	def self.get_trackers
  		response = RestClient.get(get_link("projects/#{IssuesList::PROJECT}.json?include[]=trackers"))
	 	trackers_list = JSON.parse(response.body)
	 	trackers = []
	  	trackers_list["project"]["trackers"].each do |tracker_json|
	  		tracker = IssueTracker.new(tracker_json)
	   		trackers << [tracker.name, tracker.id]
	 	end
	 	trackers
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
