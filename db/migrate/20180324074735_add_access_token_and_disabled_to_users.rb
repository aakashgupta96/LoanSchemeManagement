class AddAccessTokenAndDisabledToUsers < ActiveRecord::Migration
  def change
    add_column :users, :access_token, :string, default: nil
    add_column :users, :disabled, :boolean, default: false
  end
end
