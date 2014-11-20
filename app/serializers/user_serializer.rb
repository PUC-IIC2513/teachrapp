class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :role
  has_one :group
end
