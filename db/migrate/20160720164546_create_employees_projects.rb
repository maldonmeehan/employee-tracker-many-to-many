class CreateEmployeesProjects < ActiveRecord::Migration
  def change
    create_table(:employees_projects) do |t|
      t.column(:employee_id, :int)
      t.column(:porject_id, :int)

      t.timestamps()
    end
  end
end
