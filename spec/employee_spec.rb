require('spec_helper.rb')

describe(Employee) do
  describe('#division') do
    it("tells which division it belongs to") do
      test_division = Division.create({:name => "division"})
      test_employee = Employee.create({:name => "employee", :division_id => test_division.id})
      expect(test_employee.division()).to(eq(test_division))
    end
  end
  describe('#project') do
    it("tells which project it belongs to") do
      test_project = Project.create({:name => "project"})
      test_employee = Employee.create({:name => "employee", :project_id => test_project.id})
      expect(test_employee.project()).to(eq(test_project))
    end
  end
end
