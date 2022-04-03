require 'rails_helper'

describe Api::V1::HashMapsController, type: :request do

  let (:user) { create_user }

  describe 'GET /api/v1/users/:user_id/hash_maps' do

    context 'when the request is valid' do
      before do
        login_with_api(user)

        HashMap.create(user_id: user.id, name: "A hash map name", data:  '{"key1": "value1", "key2": "value2"}')
        
        get "/api/v1/users/#{user.id}/hash_maps",
        headers: {
          'Authorization': response.headers['Authorization']
        }
      end
    

      it 'creates a hash_map and returns' do
        expect(json).not_to be_empty
      end

      it 'returns 200 with data' do
        expect(response.status).to eq(200)
      end
    end

    context 'when the request is without authorization header' do
      before do
        login_with_api(user)
        get "/api/v1/users/#{user.id}/hash_maps"
      end

      it 'returns 401 with data' do
        expect(response.status).to eq(401)
      end
    end
  end

  describe 'POST /api/v1/users/:user_id/hash_maps' do

    context 'when the request is valid' do
      before do
        login_with_api(user)
        post "/api/v1/users/#{user.id}/hash_maps", params: { hash_map: {
          user_id: user.id,
          name: "A hash map name",
          data:  '{"key1": "value1", "key2": "value2"}'
        } },
        headers: {
          'Authorization': response.headers['Authorization']
        }
      end
    

      it 'creates a hash_map and returns' do
        expect(json['data']).to have_type('hash_maps')
      end

      it 'returns 200 with data' do
        expect(response.status).to eq(200)
      end
    end

    context 'when the request is without authorization header' do
      before do
        login_with_api(user)
        post "/api/v1/users/#{user.id}/hash_maps"
      end

      it 'returns 401 with data' do
        expect(response.status).to eq(401)
      end
    end
  end

  describe 'get api/v1/all_hash_maps' do
    context "when user is a member" do
      before do
        login_with_api(user)
        get "/api/v1/all_hash_maps", headers: {
          'Authorization': response.headers['Authorization']
        }
      end

      it 'returns 401' do
        expect(response.status).to eq(401)
      end
    end

    context "when user is a super_admin" do
      before do
        user.update(role: User::ROLE_SUPER_ADMIN)
        login_with_api(user)
        get "/api/v1/all_hash_maps", headers: {
          'Authorization': response.headers['Authorization']
        }
      end

      it 'returns 200' do
        expect(response.status).to eq(200)
      end
    end
  end
end
