require 'rails_helper'

describe 'Authentication', type: :request do
  context 'on success' do
    let(:user) { create(:user, email: 'example_email@fake.com', password: 'password') }
    let(:user_params) { { user: { email: user.email, password: user.password }} }

    it 'authenticates the client response a jwt' do
      post api_v1_auth_path, params: user_params

      response_body = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
      expect(response_body.include?('token')).to eq true

      token = response_body['token']
      expect { JsonWebToken.decode(token) }.to_not raise_error
    end
  end

  context 'on fail' do
    let(:invalid_email) { 'invalid_email@fake.com' }
    let(:invalid_password) { 'invalid_password'  }
    let(:invalid_params) { { user: { email: invalid_email, password: invalid_password }} }

    it 'authenticates the client response errors' do
      post api_v1_auth_path, params: invalid_params

      expect(response).to have_http_status(:unauthorized)

      response_body = JSON.parse(response.body)
      expect(response_body.include?('errors')).to eq true
      expect(response_body['errors'].first).to eq 'Invalid email or password'
    end
  end
end
