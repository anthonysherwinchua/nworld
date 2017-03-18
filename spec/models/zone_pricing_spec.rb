require 'rails_helper'

RSpec.describe ZonePricing, type: :model do

  subject { build(:zone_pricing) }

  it { is_expected.to validate_presence_of(:zone) }
  it { is_expected.to validate_presence_of(:weight_min) }
  it { is_expected.to validate_presence_of(:weight_max) }
  it { is_expected.to validate_presence_of(:price) }

  it { is_expected.to validate_uniqueness_of(:weight_min).scoped_to(:zone_id).with_message('Duplicate record.') }

  it { is_expected.to validate_numericality_of(:weight_min).is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:weight_max).is_greater_than(0) }

  it { is_expected.to validate_inclusion_of(:price).in_range(0.5..20_000.0) }

  it { is_expected.to belong_to(:zone).inverse_of(:zone_pricings) }

end
