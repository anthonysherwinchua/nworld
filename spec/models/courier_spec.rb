require 'rails_helper'

RSpec.describe Courier, type: :model do

  subject { build(:courier) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

  it { is_expected.to have_many(:zones).inverse_of(:courier) }
end
