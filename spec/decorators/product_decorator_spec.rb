require 'rails_helper'

RSpec.describe ProductDecorator, type: :decorator do

  let(:product) { build(:product) }

  subject { described_class.new(product) }

  describe '#price' do

    it { expect(subject.price).to eq("PHP #{product.price}") }

  end

  describe '#packaged_weight' do

    it { expect(subject.packaged_weight).to eq("#{product.weight} kg(s) / #{product.unit}") }

  end

end
