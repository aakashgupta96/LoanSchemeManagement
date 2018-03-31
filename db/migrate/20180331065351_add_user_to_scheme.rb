class AddUserToScheme < ActiveRecord::Migration
  def change
    add_column :schemes, :user_id, :integer
  end
end
