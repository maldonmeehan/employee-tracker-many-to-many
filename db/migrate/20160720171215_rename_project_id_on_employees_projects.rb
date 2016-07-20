class RenameProjectIdOnEmployeesProjects < ActiveRecord::Migration
  def change
    rename_column(:employees_projects, :porject_id, :project_id)
  end
end
