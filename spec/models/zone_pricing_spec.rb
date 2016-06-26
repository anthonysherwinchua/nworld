require 'rails_helper'

RSpec.describe ZonePricing, type: :model do

  it { is_expected.to validate_presence_of(:zone) }
  it { is_expected.to validate_presence_of(:weight) }
  it { is_expected.to validate_presence_of(:price) }

  it { is_expected.to validate_uniqueness_of(:weight).scoped_to(:zone_id).case_insensitive.with_message('Duplicate record.') }

  it { is_expected.to validate_numericality_of(:weight).is_greater_than(0) }

  it { is_expected.to validate_inclusion_of(:price).in_range(0.5..20_000.0) }

  it { is_expected.to belong_to(:zone).inverse_of(:zone_pricings) }

end
