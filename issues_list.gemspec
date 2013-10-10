require File.expand_path("../lib/issues_list/version", __FILE__)

# Provide a simple gemspec so that you can easily use your
# Enginex project in your Rails apps through Git.
Gem::Specification.new do |s|
  s.name                      = "issues_list"
  s.version                   = IssuesList::VERSION
  s.platform                  = Gem::Platform::RUBY
  s.authors                   = [ "n.zykov" ]
  s.email                     = [ "n.zykov@sv-lab.ru" ]
  s.homepage                  = "http://sv-lab.ru"
  s.description               = "A simple Rails 3 engine gem that adds a team page to any Rails 3 application."
  s.summary                   = "team_page-#{s.version}"

  s.rubyforge_project         = "issues_list"
  s.required_rubygems_version = "> 1.3.6"

  s.add_dependency "activesupport" , "~> 3.2.14"
  s.add_dependency "rails"         , "~> 3.2.14"
  s.add_dependency "rest-client"
  s.add_dependency "json"

  s.require_path = 'lib'
end