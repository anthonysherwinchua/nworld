require 'rails_helper'

RSpec.describe Package, type: :model do

  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:worth) }

  it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:worth).is_greater_than(0) }
end
