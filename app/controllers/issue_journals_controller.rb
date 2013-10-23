require 'rest-client'
require 'json'

class IssueJournalsController < ApplicationController
	
	before_filter :authenticate_user!


	def create
		issue = {
			"issue" => {
				"notes" => "[id:#{current_user.id}]#{params["issue_journal"]["notes"]}"
			}
		}
		response = RestClient.put(get_link("issues/#{params["issue_journal"]["issue"]}.json"), issue.to_json, :content_type => :json, :accept => :json)
		redirect_to "/issues/#{params["issue_journal"]["issue"]}"
	end

	def get_link(path)
		if path.index("?")==nil
			symbol = "?"
		else
			symbol = "&"
		end
		return "#{IssuesList::DOMAIN}/#{path}#{symbol}key=#{IssuesList::REDMINE_TOKEN}&offset=0&limit=500"
	end

end
