require 'rails_helper'

RSpec.describe 'on Create Schools', type: :request do
  let(:user) { create(:user, email: 'example_email@fake.com', password: 'password') }
  let(:expected_result) {
    {"data"=>
     {"id"=>"1",
      "type"=>"schools",
      "attributes"=>{"name"=>"example_name", "address"=>"example_addres"}}}
  }

  context 'creates school successfuly' do
    it 'with valid attributes' do
      school_params = { school: { name: 'example_name', address: 'example_addres' } }
      post api_v1_schools_path, headers: authorization_headers, params: school_params

      expect(response).to have_http_status(:created)
      expect(json).to eq expected_result
    end
  end

  context 'fails on create schools' do
    it 'fails without jwt' do
      school_params = { school: { name: 'example_name', address: 'example_addres' } }
      post api_v1_schools_path, params: school_params

      expect(response).to have_http_status(:unauthorized)
      expect(json.include?(:errors)).to eq true
      expect(json[:errors].first).to eq 'invalid auth token'
    end
  end
end
