require File.expand_path("../lib/issues_list/version", __FILE__)

# Provide a simple gemspec so that you can easily use your
# Enginex project in your Rails apps through Git.
Gem::Specification.new do |s|
  s.name                      = "rails_redmine_issues"
  s.version                   = IssuesList::VERSION
  s.date                      = '2013-10-23'
  s.platform                  = Gem::Platform::RUBY
  s.authors                   = [ "n.zykov", "artem-russkikh" ]
  s.email                     = [ "n.zykov@sv-lab.ru", "rusartx@gmail.com" ]
  s.homepage                  = "http://sv-lab.ru"
  s.description               = "A simple Rails 3 engine gem that adds the issues engine (Redmine) to any Rails 3 application."
  s.summary                   = "rails_redmine_issues-#{s.version}"

  s.rubyforge_project         = "rails_redmine_issues"
  s.required_rubygems_version = "> 1.3.6"

  s.add_dependency "activesupport" , "~> 3.2.14"
  s.add_dependency "rails"         , "~> 3.2.14"
  s.add_dependency "rest-client"
  s.add_dependency "json"

  s.require_path = 'lib'
end
