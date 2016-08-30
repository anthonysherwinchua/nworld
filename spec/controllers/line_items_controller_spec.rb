require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do

  describe 'POST #create' do

    let(:cart) { create(:cart) }
    let(:product) { create(:product) }

    subject { post :create, { product_id: product.id }, cart_id: cart.id }

    it { expect(subject).to redirect_to(product_path(product.id)) }

    context 'new product is added' do
      it { expect { subject }.to change { LineItem.count }.by(1) }
    end

    context 'product already exist, just need to increment' do
      before { @line_item = cart.line_items.create(product_id: product.id, quantity: 1) }

      it { expect { subject }.not_to change { LineItem.count } }
      it 'increments the existing line item quantity' do
        subject
        expect(@line_item.reload.quantity).to eq(2)
      end
    end
  end

end
