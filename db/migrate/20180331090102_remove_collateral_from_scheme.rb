class RemoveCollateralFromScheme < ActiveRecord::Migration
  def change
  	remove_column :schemes, :collateral
  end
end
