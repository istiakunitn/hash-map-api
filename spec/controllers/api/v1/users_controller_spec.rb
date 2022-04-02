require 'rails_helper'

describe Api::V1::UsersController, type: :request do

  let (:user) { create_user }

  context 'When fetching a user' do
    before do
      login_with_api(user)
      get "/api/v1/users/#{user.id}", headers: {
        'Authorization': response.headers['Authorization']
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns the user' do
      expect(json['data']).to have_id(user.id.to_s)
      expect(json['data']).to have_type('users')
    end
  end

  context 'When a user is missing' do
    before do
      login_with_api(user)
      get "/api/v1/users/blank", headers: {
        'Authorization': response.headers['Authorization']
      }
    end

    it 'returns 404' do
      expect(response.status).to eq(404)
    end
  end

  context 'When the Authorization header is missing' do
    before do
      get "/api/v1/users/#{user.id}"
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end

  context 'get #index' do
    context "when user is a member" do
      before do
        login_with_api(user)
        get "/api/v1/users", headers: {
          'Authorization': response.headers['Authorization']
        }
      end

      it 'returns 401' do
        expect(response.status).to eq(401)
      end

      # it 'returns users' do
      #   expect(json['data']).to have_id(user.id.to_s)
      #   expect(json['data']).to have_type('users')
      # end
    end

    context "when user is a super_admin" do
      before do
        user.update(role: User::ROLE_SUPER_ADMIN)
        login_with_api(user)
        get "/api/v1/users", headers: {
          'Authorization': response.headers['Authorization']
        }
      end

      it 'returns 200' do
        expect(response.status).to eq(200)
      end
    end
  end
end
