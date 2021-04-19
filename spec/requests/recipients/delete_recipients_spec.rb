require 'rails_helper'

RSpec.describe 'on Delete Recipients', type: :request do
  let(:user) { create(:user, email: 'example_email@fake.com', password: 'password') }
  let(:example_school) { create(:school, name: 'example_name', address: 'example_address') }
  let(:example_recipient) { create(:recipient, school_id: example_school.id, name: 'example_name', address: 'example_address') }

  context 'deletes recipient successfuly' do
    let(:expected_result) { 'Recipient deleted successfully' }

    it 'with valid attributes' do
      delete api_v1_school_recipient_path(example_school, example_recipient), headers: authorization_headers

      expect(response).to have_http_status(:accepted)
      expect(json[:message]).to eq expected_result
    end
  end

  context 'fails on update recipients' do
    it 'fails without jwt' do
      delete api_v1_school_recipient_path(example_school, example_recipient)

      expect(response).to have_http_status(:unauthorized)
      expect(json.include?(:errors)).to eq true
      expect(json[:errors].first).to eq 'invalid auth token'
    end
  end
end
