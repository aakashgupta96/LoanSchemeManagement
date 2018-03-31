class RemoveFieldsToScheme < ActiveRecord::Migration
  def change
    remove_column :eligibilities, :collateral
  end
end
