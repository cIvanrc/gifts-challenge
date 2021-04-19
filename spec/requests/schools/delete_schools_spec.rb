require 'rails_helper'

RSpec.describe 'on Delete Schools', type: :request do
  let(:user) { create(:user, email: 'example_email@fake.com', password: 'password') }
  let(:example_school) { create(:school, name: 'example_name', address: 'example_address') }

  context 'deletes school successfuly' do
    let(:expected_result) { 'School deleted successfully' }

    it 'with valid attributes' do
      delete api_v1_school_path(example_school), headers: authorization_headers

      expect(response).to have_http_status(:accepted)
      expect(json[:message]).to eq expected_result
    end
  end

  context 'fails on update schools' do
    it 'fails without jwt' do
      delete api_v1_school_path(example_school)

      expect(response).to have_http_status(:unauthorized)
      expect(json.include?(:errors)).to eq true
      expect(json[:errors].first).to eq 'invalid auth token'
    end
  end
end
