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
  title = params[:title]
  project = Project.new({:title =>title,:id => nil})
  project.save
  @projects = Project.all
  erb(:projects)
end

get ('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  erb(:edit_project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @project.update(params[:title])
  @projects = Project.all
  erb(:projects)
end

delete('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  @projects = Project.all
  erb(:projects)
end

post('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i())
  name = params[:volunteer_name]
  volunteer = Volunteer.new({:name => name,:project_id => @project.id, :id => nil})
  volunteer.save()
  erb(:project)
end