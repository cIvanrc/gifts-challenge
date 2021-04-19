require 'rails_helper'

describe 'on Get recipients', type: :request do
  let(:user) { create(:user, email: 'example_email@fake.com', password: 'password') }
  let(:example_school) { create(:school) }

  context 'on success' do
    let(:expected_result) {
      {"data"=>
       [{"id"=>"1",
         "type"=>"recipients",
         "attributes"=>
       {"school-id"=>1, "name"=>"example_name", "address"=>"example_address"},
         "relationships"=>{"school"=>{"data"=>{"id"=>"1", "type"=>"schools"}}}}]}
    }
    before do
      create(:recipient, school_id: example_school.id, name: 'example_name', address: 'example_address')
    end

    it 'list all recipients' do
      get api_v1_school_recipients_path(example_school), headers: authorization_headers

      expect(response).to have_http_status(:ok)
      expect(json).to eq expected_result
    end
  end

  it 'fail without jwt' do
    get api_v1_school_recipients_path(example_school)

    expect(response).to have_http_status(:unauthorized)
    expect(json.include?(:errors)).to eq true
    expect(json[:errors].first).to eq 'invalid auth token'
  end
end
