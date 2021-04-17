require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  it { should validate_uniqueness_of(:name) }
end
