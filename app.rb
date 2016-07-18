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
