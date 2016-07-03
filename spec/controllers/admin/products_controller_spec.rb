require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

  include_examples 'admin-only controller'

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:products) { create_list(:product, count) }
    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items).map(&:id).sort).to eq(products.map(&:id)) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(Product) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do
      let(:category) { create(:category) }
      let(:product_attrs) { attributes_for(:product).merge(category_id: category.id) }

      before { post :create, product: product_attrs }

      it { is_expected.to redirect_to(admin_products_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:product_attrs) { attributes_for(:product, :invalid) }

      before { post :create, product: product_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:product) { create(:product) }

    before { get :edit, id: product }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:product) { create(:product) }
      let(:product_attrs) { attributes_for(:product) }

      before { put :update, id: product, product: product_attrs }

      it { is_expected.to redirect_to(admin_products_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:product) { create(:product) }
      let(:product_attrs) { attributes_for(:product, :invalid) }

      before { put :update, id: product, product: product_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:product) { create(:product) }

    before { delete :destroy, id: product }

    it { is_expected.to redirect_to(admin_products_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
