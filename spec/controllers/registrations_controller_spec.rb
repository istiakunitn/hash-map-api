require 'rails_helper'

describe Users::RegistrationsController, type: :request do

  let (:user) { build_user }
  let (:existing_user) { create_user }
  let (:signup_url) { '/api/v1/signup' }

  context 'When creating a new user' do
    before do
      post signup_url, params: {
        user: {
          email: user.email,
          password: user.password,
          role: User::ROLE_SUPER_ADMIN
        }
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns a token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns the user email' do
      expect(JSON(response.body)['data']).to have_attribute(:email).with_value(user.email)
    end
  end

  context 'When an email already exists' do

    before do
      post signup_url, params: {
        user: {
          email: existing_user.email,
          password: existing_user.password,
          role: User::ROLE_MEMBER
        }
      }
    end

    it 'returns 400' do
      expect(response.status).to eq(400)
    end
  end
end
