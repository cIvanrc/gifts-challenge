require 'rails_helper'

describe 'on Update recipients', type: :request do
  let(:user) { create(:user, email: 'example_email@fake.com', password: 'password') }
  let(:example_school) { create(:school) }
  let(:recipient) { create(:recipient, school_id: example_school.id, name: 'example_name', address: 'example_address') }

  context 'on success' do
    let(:recipient_params) {{ recipient: { name: 'updated_name', address: 'updated_address' } }}

    let(:expected_result) {
      {"data"=>
       {"id"=>"1",
        "type"=>"recipients",
        "attributes"=>
       {"school-id"=>1, "name"=>"updated_name", "address"=>"updated_address"},
         "relationships"=>{"school"=>{"data"=>{"id"=>"1", "type"=>"schools"}}}}}
    }

    it 'update a recipient' do
      put api_v1_school_recipient_path(example_school, recipient), headers: authorization_headers, params: recipient_params

      expect(response).to have_http_status(:accepted)
      expect(json).to eq expected_result
    end
  end

  it 'fail without jwt' do
    put api_v1_school_recipient_path(example_school, recipient)

    expect(response).to have_http_status(:unauthorized)
    expect(json.include?(:errors)).to eq true
    expect(json[:errors].first).to eq 'invalid auth token'
  end
end
