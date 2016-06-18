require 'rails_helper'

RSpec.describe Zone, type: :model do

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

  it { is_expected.to have_many(:shippable_countries).inverse_of(:zone) }
  it { is_expected.to have_many(:zone_pricings).inverse_of(:zone) }

end
