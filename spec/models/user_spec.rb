require 'rails_helper'

RSpec.describe User, type: :model do

  context "Validations" do
    it "builds a valid user" do
      user = User.new(valid_user_attributes)

      expect(user).to be_valid
    end

    it "validates presence of email" do
      valid_attributes = valid_user_attributes
      valid_attributes.delete(:email)

      expect(User.new(valid_attributes)).not_to be_valid
    end

    it "validates presence of role" do
      valid_attributes = valid_user_attributes
      valid_attributes.delete(:role)

      expect(User.new(valid_attributes)).not_to be_valid
    end
  end

  context "after_create" do
    it "generates username" do
      user = User.create(valid_user_attributes)
      expect(user.username).not_to be_blank
    end
  end

  def valid_user_attributes
    {
      email: "test@email.it",
      first_name: "Mister",
      last_name: "Last",
      role: User::ROLE_SUPER_ADMIN
    }
  end
end
