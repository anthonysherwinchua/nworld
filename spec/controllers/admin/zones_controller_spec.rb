require 'rails_helper'

RSpec.describe Admin::ZonesController, type: :controller do

  include_examples 'admin-only controller'

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:zones) { create_list(:zone, count) }
    let(:all_zones) { zones.map(&:id).sort }
    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items).ids.sort).to eq(all_zones) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(Zone) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:courier) { create(:courier) }
      let(:zone_attrs) { attributes_for(:zone, courier_id: courier.id) }

      before { post :create, zone: zone_attrs }

      it { is_expected.to redirect_to(admin_zones_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do

      let(:zone_attrs) { attributes_for(:zone, :invalid) }

      before { post :create, zone: zone_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:zone) { create(:zone) }

    before { get :edit, id: zone }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:zone) { create(:zone) }
      let(:zone_attrs) { attributes_for(:zone) }

      before { put :update, id: zone, zone: zone_attrs }

      it { is_expected.to redirect_to(admin_zones_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:zone) { create(:zone) }
      let(:zone_attrs) { attributes_for(:zone, :invalid) }

      before { put :update, id: zone, zone: zone_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:zone) { create(:zone) }

    before { delete :destroy, id: zone }

    it { is_expected.to redirect_to(admin_zones_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
