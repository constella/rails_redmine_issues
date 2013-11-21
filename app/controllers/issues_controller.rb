require 'rest-client'
require 'json'

class IssuesController < ApplicationController

	before_filter :authenticate_user!
  	authorize_resource

	def index
		response = RestClient.get(get_link("issues.json"))
	 	issues_list = JSON.parse(response.body)
	 	@issues = []
	  	issues_list["issues"].each do |issue_json|
	  		issue = Issue.new(issue_json)
	  		if IssuesList::USER
	  			if issue.user==current_user
	   				@issues << issue
	   			end
	   		else
	   			@issues << issue
	   		end
	 	end
	end

	def show
		begin
			response = RestClient.get(get_link("issues/#{params[:id]}.json?include[]=journals"))
		rescue RestClient::Forbidden
			render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
		end
		if response != nil
		 	issue_json = JSON.parse(response.body)
		 	issue = Issue.new(issue_json['issue'])
	  		if IssuesList::USER
		 		if issue.user==current_user
		 			@issue = issue
		 		else
		 			render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
		 		end
			else
				@issue = issue
		 	end
		 end
	end

	def create
		issue = {
			"issue" => {
				"project_id" => IssuesList::PROJECT,
				"subject" => "[id:#{current_user.id}]#{params[:issue][:name]}",
				"description" => params[:issue][:description],
				"tracker_id" => params[:issue][:tracker],
				"status_id" => 1
			}
		}
		response = RestClient.post(get_link("issues.json"), issue.to_json, :content_type => :json, :accept => :json)
		redirect_to issues_path
	end

	def update
		issue = {
			"issue" => {
				"status_id" => params["issue"]["status"]
			}
		}
		response = RestClient.put(get_link("issues/#{params["issue"]["id"]}.json"), issue.to_json, :content_type => :json, :accept => :json)
		redirect_to "/issues/#{params["issue"]["id"]}"
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
