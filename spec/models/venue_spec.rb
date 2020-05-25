require 'rails_helper'

RSpec.describe Venue, type: :model do
  let(:venue) { build(:venue) }

  it {is_expected.to have_one(:layout).dependent(:destroy)}

  it {is_expected.to validate_presence_of(:name)}

  it {is_expected.to respond_to(:name)}
end
