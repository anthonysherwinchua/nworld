require 'rails_helper'

RSpec.describe Admin::ZonePricingsController, type: :controller do

  include_examples 'admin-only controller'

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let(:zones) { create_list(:zone, count) }
    let(:zone) { zones.first }
    let!(:zone_pricings) { create_list(:zone_pricing, count, zone: zone) }

    before { get :index, zone_id: zones.first }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:zones).map(&:id).sort).to eq(zones.map(&:id)) }
    it { expect(assigns(:zone).id).to eq(zone.id) }
    it { expect(assigns(:current_items).map(&:id).sort).to eq(zone_pricings.map(&:id)) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(ZonePricing) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do
      let(:zone) { create(:zone) }
      let(:zone_pricing_attrs) { attributes_for(:zone_pricing).merge(zone_id: zone.id) }

      before { post :create, zone_pricing: zone_pricing_attrs }

      it { is_expected.to redirect_to(admin_zone_pricings_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:zone_pricing_attrs) { attributes_for(:zone_pricing, :invalid) }

      before { post :create, zone_pricing: zone_pricing_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:zone_pricing) { create(:zone_pricing) }

    before { get :edit, id: zone_pricing }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:zone_pricing) { create(:zone_pricing) }
      let(:zone_pricing_attrs) { attributes_for(:zone_pricing) }

      before { put :update, id: zone_pricing, zone_pricing: zone_pricing_attrs }

      it { is_expected.to redirect_to(admin_zone_pricings_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:zone_pricing) { create(:zone_pricing) }
      let(:zone_pricing_attrs) { attributes_for(:zone_pricing, :invalid) }

      before { put :update, id: zone_pricing, zone_pricing: zone_pricing_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:zone_pricing) { create(:zone_pricing) }

    before { delete :destroy, id: zone_pricing }

    it { is_expected.to redirect_to(admin_zone_pricings_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
