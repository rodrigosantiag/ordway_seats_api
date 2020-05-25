require 'rails_helper'

RSpec.describe Layout, type: :model do
  let(:layout) { build(:layout) }

  it { is_expected.to belong_to(:venue) }
  it { is_expected.to have_many(:seats).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:rows) }
  it { is_expected.to validate_presence_of(:columns) }

  it { is_expected.to respond_to(:rows) }
  it { is_expected.to respond_to(:columns) }
end
