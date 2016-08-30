require 'rails_helper'

RSpec.describe LinePackage, type: :model do

  it { is_expected.to have_many(:line_items).inverse_of(:line_package) }
  it { is_expected.to belong_to(:cart).inverse_of(:line_packages) }
  it { is_expected.to belong_to(:package) }

  it { is_expected.to validate_presence_of(:cart) }
  it { is_expected.to validate_presence_of(:package) }

end
