require 'rails_helper'

RSpec.describe ShippableCountry, type: :model do

  subject { build(:shippable_country) }

  it { is_expected.to validate_presence_of(:zone) }
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:zone_id).case_insensitive.with_message('Duplicate record.') }

  it { is_expected.to belong_to(:zone).inverse_of(:shippable_countries) }

end
