require 'rails_helper'

RSpec.describe 'Schools', type: :request do
  let(:user) { create(:user, email: 'example_email@fake.com', password: 'password') }

  describe 'GET /index' do
    let(:expected_result) {
      { 'id'=>'1',
        'type'=>'schools',
        'attributes'=> { 'name'=>'example_name',
                        'address'=>'example_address'
        }
      }
    }

    it 'get all Schools' do
      create(:school, name: 'example_name', address: 'example_address')
      get api_v1_schools_path, headers: authorization_headers

      expect(response).to have_http_status(:ok)

      response_body = JSON.parse(response.body)
      expect(response_body.include?('data')).to eq true
      expect(response_body['data'].first).to eq expected_result
    end
  end

  context 'unauthorized requests without jwt' do
    it 'unauthorized GET /index' do
      get api_v1_schools_path

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
