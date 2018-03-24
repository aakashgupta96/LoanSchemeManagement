class CreateLoanApplications < ActiveRecord::Migration
  def change
    create_table :loan_applications do |t|

      t.timestamps null: false
    end
  end
end
