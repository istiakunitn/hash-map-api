require 'rails_helper'

RSpec.describe HashMap, type: :model do

  let (:user) { create_user }

  context "Validations" do
    it "builds a valid HashMap" do
      hash_map = HashMap.new(valid_hash_map_attributes)

      expect(hash_map).to be_valid
    end

    it "validates presence of user" do
      valid_attributes = valid_hash_map_attributes
      valid_attributes.delete(:user)

      expect(HashMap.new(valid_attributes)).not_to be_valid
    end

    it "validates presence of name" do
      valid_attributes = valid_hash_map_attributes
      valid_attributes.delete(:name)

      expect(HashMap.new(valid_attributes)).not_to be_valid
    end

    it "validates presence of data" do
      valid_attributes = valid_hash_map_attributes
      valid_attributes.delete(:data)

      expect(HashMap.new(valid_attributes)).not_to be_valid
    end
  end

  def valid_hash_map_attributes
    {
      user: user,
      name: "A hash map name",
      data: { "key1": "value1", "key2": "value2" }
    }
  end
end
