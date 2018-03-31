class CreateLoanRequests < ActiveRecord::Migration
  def change
    create_table :loan_requests do |t|
      t.references :user, index: true, foreign_key: true
      t.float :score
      t.references :scheme, index: true, foreign_key: true
    end
  end
end
