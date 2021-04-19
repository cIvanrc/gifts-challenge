require 'rails_helper'

describe 'on Create recipients', type: :request do
  let(:user) { create(:user, email: 'example_email@fake.com', password: 'password') }
  let(:example_school) { create(:school) }

  context 'on success' do
    let(:recipient_params) {{ recipient: { name: 'example_name', address: 'example_address' } }}

    let(:expected_result) {
      {"data"=>
       {"id"=>"1",
        "type"=>"recipients",
        "attributes"=>
       {"school-id"=>1, "name"=>"example_name", "address"=>"example_address"},
         "relationships"=>{"school"=>{"data"=>{"id"=>"1", "type"=>"schools"}}}}}
    }

    it 'create a recipient' do
      post api_v1_school_recipients_path(example_school), headers: authorization_headers, params: recipient_params

      expect(response).to have_http_status(:created)
      expect(json).to eq expected_result
    end
  end

  it 'fail without jwt' do
    post api_v1_school_recipients_path(example_school)

    expect(response).to have_http_status(:unauthorized)
    expect(json.include?(:errors)).to eq true
    expect(json[:errors].first).to eq 'invalid auth token'
  end
end
