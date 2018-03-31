class Scheme < ActiveRecord::Base
  belongs_to :department
  has_many :eligibilities
  belongs_to :officer, class_name: "User", foreign_key: :user_id

  accepts_nested_attributes_for :eligibilities, :allow_destroy => true
  def as_json(options = {})
    SchemeSerializer.new(self).as_json(root: false)
  end

end
