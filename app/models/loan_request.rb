class LoanRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :scheme

  def calculate_score
    76.37
  end
  
end