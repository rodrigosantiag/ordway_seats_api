require 'rails_helper'

RSpec.describe Seat, type: :model do
  let(:seat) { build(:seat) }

  it { is_expected.to belong_to(:layout) }

  it { is_expected.to validate_presence_of(:row) }
  it { is_expected.to validate_presence_of(:column) }
  it { is_expected.to validate_presence_of(:status) }

  it { is_expected.to respond_to(:row) }
  it { is_expected.to respond_to(:column) }
  it { is_expected.to respond_to(:status) }
end
