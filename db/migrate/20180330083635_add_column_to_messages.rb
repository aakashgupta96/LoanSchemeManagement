class AddColumnToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :ticket, index: true, foreign_key: true
  end
end
