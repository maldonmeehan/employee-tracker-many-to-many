class AddProjectIdToEmployeesProjects < ActiveRecord::Migration
  def change
    add_column(:employees_projects, :project_id, :int)
  end
end
