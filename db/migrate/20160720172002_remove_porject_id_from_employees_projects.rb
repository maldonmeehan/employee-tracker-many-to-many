class RemovePorjectIdFromEmployeesProjects < ActiveRecord::Migration
  def change
    remove_column(:employees_projects, :porject_id, :int)
  end
end
