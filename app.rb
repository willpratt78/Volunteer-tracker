require('sinatra')
require('sinatra/reloader')
require('./lib/project.rb')
require('./lib/volunteer.rb')
require('pry')
also_reload('lib/**/*.rb')

get ('/') do
  @project = Project.all
  erb(:projects)
end

get ('/projects') do
  @project = Project.all
  erb(:projects)
end

