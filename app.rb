require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require ('pg')

DB = PG.connect({:dbname => "volunteer_tracker", :password => 125125})

get ('/') do
  @projects = Project.all
  erb(:projects)
end

get ('/projects') do
  @projects = Project.all
  erb(:projects)
end

post ('/projects') do
  title = params[:project_name]
  project = Project.new({:title =>title,:id => nil})
  project.save
  @projects = Project.all
  erb(:projects)
end