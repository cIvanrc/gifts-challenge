require 'rails_helper'

RSpec.describe 'on Update Schools', type: :request do
  let(:user) { create(:user, email: 'example_email@fake.com', password: 'password') }
  let(:example_school) { create(:school, name: 'example_name', address: 'example_address') }
  let(:school_params) {{ school: { name: 'updated_name', address: 'updated_addres' } }}

  context 'updates school successfuly' do
    let(:expected_result) {
      {"data"=>
       {"id"=>"1",
        "type"=>"schools",
        "attributes"=>{"name"=>"updated_name", "address"=>"updated_addres"}}}
    }

    it 'with valid attributes' do
      put api_v1_school_path(example_school), headers: authorization_headers, params: school_params

      expect(response).to have_http_status(:accepted)
      expect(json).to eq expected_result
    end
  end

  context 'fails on update schools' do
    it 'fails without jwt' do
      put api_v1_school_path(example_school), params: school_params

      expect(response).to have_http_status(:unauthorized)
      expect(json.include?(:errors)).to eq true
      expect(json[:errors].first).to eq 'invalid auth token'
    end
  end
end
