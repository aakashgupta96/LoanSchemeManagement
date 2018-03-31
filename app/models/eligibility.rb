class Eligibility < ActiveRecord::Base
  belongs_to :scheme

  def as_json(options = {})
    EligibilitySerializer.new(self).as_json(root: false)
  end
end
