require 'rails_helper'

RSpec.describe ZoneRangePricing, type: :model do

  it { is_expected.to serialize(:weight_range) }

  it { is_expected.to validate_presence_of(:zone) }
  it { is_expected.to validate_presence_of(:weight_range) }
  it { is_expected.to validate_presence_of(:price) }

  it { is_expected.to belong_to(:zone).inverse_of(:zone_range_pricings) }

end
