require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/employee')
require('./lib/division')
require('./lib/project')
require('pg')
require('pry')

get('/') do
  @employees = Employee.all()
  @divisions = Division.all()
  @projects = Project.all()
  erb(:index)
end

post('/employees') do
  name = params.fetch('name')
  division_id = params["division_id"].to_i()
  project_ids = params["project_ids"]
  @employee = Employee.create({:name => name, :division_id => division_id, :project_ids => project_ids})
  @employees = Employee.all()
  @divisions = Division.all()
  @projects = Project.all()
  erb(:index)
end

post('/divisions') do
  name = params.fetch('name')
  @division = Division.create({:name => name})
  @divisions = Division.all()
  @employees = Employee.all()
  @projects = Project.all()
  erb(:index)
end

get("/divisions/:id") do
  @division = Division.find(params.fetch('id').to_i())
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:division)
end

get("/divisions/:id/edit") do
  @division = Division.find(params.fetch('id').to_i())
  erb(:division_edit)
end

patch("/divisions/:id") do
  name = params.fetch("name")
  @division = Division.find(params.fetch('id').to_i())
  @division.update({:name => name})
  erb(:success)
end

delete("/divisions/:id") do
  @division = Division.find(params.fetch('id').to_i())
  @division.delete()
  @divisions = Division.all()
  erb(:success)
end

get("/employees/:id") do
  @employee = Employee.find(params.fetch('id').to_i())
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:employee)
end

get("/employees/:id/edit") do
  @employee = Employee.find(params.fetch("id").to_i())
  @divisions = Division.all()
  @projects = Project.all()
  erb(:employee_edit)
end

patch("/employees/:id") do
  @employee = Employee.find(params.fetch('id').to_i())
  name = params.fetch("name")
  if name.==("")
    name = @employee.name()
  end
  division_id = params["division_id"].to_i()
  if division_id.==("")
    division_id = @employee.division_id()
  end
  project_ids = params["project_ids"]
  if project_ids.==(nil)
    project_ids = @employee.project_ids()
  elsif
    project_ids.each do |project_id|
      project = Project.find(project_id)
      @employee.projects.push(project)
    end
  end
  @employee.update({:name => name, :division_id => division_id})
  @employees = Employee.all()
  @divisions = Division.all()
  @projects = Project.all()
  erb(:success)
end

get("/employees/:id/remove") do
  @employee = Employee.find(params.fetch("id").to_i())
  @divisions = Division.all()
  @projects = Project.all()
  erb(:employee_edit)
end

patch("/employees/:id/remove") do
  @employee = Employee.find(params.fetch('id').to_i())
  project_ids = params["project_ids"]
  if project_ids.==(nil)
    project_ids = @employee.project_ids()
  elsif
    project_ids.each do |project_id|
      project = Project.find(project_id)
      @employee.projects.destroy(project)
    end
  end
  erb(:success)
end

delete("/employees/:id") do
  @employee = Employee.find(params.fetch('id').to_i())
  @employee.delete()
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:success)
end

post('/projects') do
  name = params.fetch('name')
  @project = Project.create({:name => name})
  @projects = Project.all()
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

get("/projects/:id") do
  @project = Project.find(params.fetch('id').to_i())
  @projects = Project.all()
  @employees = Employee.all()
  erb(:project)
end

get("/projects/:id/edit") do
  @project = Project.find(params.fetch('id').to_i())
  erb(:project_edit)
end

patch("/projects/:id") do
  name = params.fetch("name")
  @project = Project.find(params.fetch('id').to_i())
  @project.update({:name => name})
  erb(:success)
end

delete("/projects/:id") do
  @project = Project.find(params.fetch('id').to_i())
  @project.delete()
  @projects = Project.all()
  erb(:success)
end
