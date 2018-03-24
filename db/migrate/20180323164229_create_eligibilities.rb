class CreateEligibilities < ActiveRecord::Migration
  def change
    create_table :eligibilities do |t|
      t.text :details
      t.references :scheme, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
