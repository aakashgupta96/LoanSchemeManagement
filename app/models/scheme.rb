class Scheme < ActiveRecord::Base
  belongs_to :department
  has_many :eligibilities
end
