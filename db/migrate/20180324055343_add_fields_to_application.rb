class AddFieldsToApplication < ActiveRecord::Migration
  def change
  	  add_column :loan_applications, :name, :string, default: ""

  end
end
