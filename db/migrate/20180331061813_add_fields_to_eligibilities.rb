class AddFieldsToEligibilities < ActiveRecord::Migration
  def change
    add_column :eligibilities, :bucket, :integer
    add_column :eligibilities, :value, :integer
    add_column :eligibilities, :weight, :float
  end
end
