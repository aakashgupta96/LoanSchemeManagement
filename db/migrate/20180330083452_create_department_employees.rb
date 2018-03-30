class CreateDepartmentEmployees < ActiveRecord::Migration
  def change
    create_table :department_employees do |t|
    	t.integer :user_id, null: false
    	t.integer :department_id, null: false
      t.timestamps null: false
    end
  end
end
