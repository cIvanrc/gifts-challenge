require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'Post /authenticate' do
    let(:user) { create(:user, username: 'username_example') }

    it 'authenticates the client' do
      post '/api/v1/authenticate', params: { username: user.username, password: 'password_example' }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
        'token' => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.KLlCfaFvDeK1aFuEYfNZvAw1zng2RoOkjv4uj_t5ZKg'
      })
    end
  end
end
