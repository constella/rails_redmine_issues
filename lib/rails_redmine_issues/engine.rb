module RailsRedmineIssues

  class Engine < Rails::Engine
	initialize "rails_redmine_issues.load_app_instance_data" do |app|
      RailsRedmineIssues.setup do |config|
        config.app_root = app.root
      end
    end

  end

end