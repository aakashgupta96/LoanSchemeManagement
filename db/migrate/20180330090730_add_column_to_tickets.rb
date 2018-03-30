class AddColumnToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :department, index: true, foreign_key: true
    add_column :tickets, :status, :integer
  end
end
