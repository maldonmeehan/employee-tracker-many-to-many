require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/employee')
require('./lib/division')
require('pg')

get('/') do
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end

post('/employees') do
  name = params.fetch('name')
  division_id = params.fetch("division_id").to_i()
  @division = Division.find(division_id)
  @employee = Employee.create({:name => name, :division_id => division_id})
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end

post('/divisions') do
  name = params.fetch("name")
  @division = Division.create({:name => name})
  @divisions = Division.all()
  erb(:index)
end

get("/divisions/:id") do
  @divisions = Division.all()
  @employees = Employee.all()
  @division = Division.find(params.fetch("id").to_i())
  erb(:division)
end

get("/divisions/:id/edit") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division_edit)
end

patch("/divisions/:id") do
  name = params.fetch("name")
  @division = List.find(params.fetch("id").to_i())
  @division.update({:name => name})
  erb(:division)
end

delete("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  @division.delete()
  @divisions = Division.all()
  erb(:index)
end

get("/employees/:id/edit") do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end

patch("/employees/:id") do
  name = params.fetch("name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:name => name})
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end

delete("/employees/:id") do
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.delete()
  @employees = Employee.all()
  erb(:index)
end
