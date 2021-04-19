require 'rails_helper'

RSpec.describe Recipient, type: :model do
  let(:school) { create(:school)  }
  let(:subject) { described_class.new(school_id: school.id, name: 'example_name', address: 'example_addres') }

  describe 'Validations' do
    context 'is valid' do

      it 'with valid attributes' do
        expect(subject).to be_valid
      end
    end

    context 'is not valid' do

      it 'without a name' do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it 'without an address' do
        subject.address = nil
        expect(subject).to_not be_valid
      end
    end
  end

  context 'on Destroy' do
    it 'can be destroyed successfully' do
      subject.save

      expect(subject.persisted?).to eq true
      subject.destroy

      expect(Recipient.exists?(subject.id)).to eq false
      expect(subject.persisted?).to eq false
    end
  end
end
