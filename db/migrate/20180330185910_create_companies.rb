class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.references :user
      t.string :incorporation_date
      t.string :incorporation_number
      t.string :company_type
      t.string :description
      t.string :team_strength
      t.string :location
      t.string :growth_rate
      t.string :pan
      t.string :contact_number
      t.string :website
      t.string :net_worth
      t.string :image
      t.string :profits
    end
  end
end
