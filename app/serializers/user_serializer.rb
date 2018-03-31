class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :image, :company_added

  def company_added
    !object.company.nil?
  end

end