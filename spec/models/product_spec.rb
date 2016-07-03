require 'rails_helper'

RSpec.describe Product, type: :model do

  it { is_expected.to define_enum_for(:status).with([:draft, :brand_new, :featured, :regular]) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:weight) }
  it { is_expected.to validate_presence_of(:unit) }
  it { is_expected.to validate_presence_of(:category) }

  it { is_expected.to validate_uniqueness_of(:title).scoped_to(:category_id).case_insensitive.with_message('Duplicate record') }
  it { is_expected.to validate_numericality_of(:weight).is_greater_than(0) }

end
