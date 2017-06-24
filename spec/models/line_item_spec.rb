require 'rails_helper'

RSpec.describe LineItem, type: :model do

  it { is_expected.to belong_to(:cart).inverse_of(:line_items) }
  it { is_expected.to belong_to(:product) }

  it { is_expected.to validate_presence_of(:cart) }
  it { is_expected.to validate_presence_of(:product) }
  it { is_expected.to validate_presence_of(:quantity) }

  it { is_expected.to validate_numericality_of(:quantity).is_greater_than(0).on(:update) }

end
