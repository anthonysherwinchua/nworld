require 'rails_helper'

RSpec.describe Zone, type: :model do

  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:courier_id).case_insensitive.with_message('Duplicate record.') }

  it { is_expected.to have_many(:shippable_countries).inverse_of(:zone) }
  it { is_expected.to have_many(:zone_pricings).inverse_of(:zone) }
  it { is_expected.to belong_to(:courier).inverse_of(:zones) }

end
