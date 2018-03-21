class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,unique: true, null: false
      t.string :password
      t.integer :role, default: 0, null: false
      t.string :name

      t.timestamps null: false
    end
  end
end
