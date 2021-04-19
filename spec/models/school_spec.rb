require 'rails_helper'

RSpec.describe School, type: :model do
  let(:subject) { described_class.new(name: 'example_name', address: 'example_addres') }

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

      expect(School.exists?(subject.id)).to eq false
      expect(subject.persisted?).to eq false
    end
  end
end
