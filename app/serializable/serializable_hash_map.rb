class SerializableHashMap < JSONAPI::Serializable::Resource
    type 'hash_maps'
  
    attributes :user, :name, :data
  end
  