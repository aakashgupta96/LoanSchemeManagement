class AddMinistryIdToDepartment < ActiveRecord::Migration
  def change
  	add_column :departments, :ministry_id, :integer
  end
end
