class CreateSchemes < ActiveRecord::Migration
  def change
    create_table :schemes do |t|
      t.string :name
      t.text :guidelines
      t.string :collateral
      t.integer :ticket_size
      t.float :interest_rate
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
