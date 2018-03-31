class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :ministry_id
end