require('spec_helper.rb')

describe(Project) do
  describe('#employees') do
      it("tells which employees are working on it") do
        test_project = Project.create({:name => 'project'})
        test_employee1 = Employee.create({:name => 'employee1', :division_id => test_project.id})
        test_employee2 = Employee.create({:name => 'employee2', :project_id => test_project.id})
       expect(test_project.employees()).to(eq([test_employee1, test_employee2]))
      end
    end
end
