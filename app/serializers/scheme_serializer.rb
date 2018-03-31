class SchemeSerializer < ActiveModel::Serializer
  attributes :id, :name, :guidelines, :ticket_size, :interest_rate, :department_id, :eligibilities
end