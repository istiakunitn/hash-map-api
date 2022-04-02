class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email, :role, :first_name, :last_name
end
