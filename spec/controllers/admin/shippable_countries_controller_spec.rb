require 'rails_helper'

RSpec.describe Admin::ShippableCountriesController, type: :controller do

  include_examples 'admin-only controller'

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:shippable_countries) { create_list(:shippable_country, count) }
    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items).map(&:id).sort).to eq(shippable_countries.map(&:id)) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(ShippableCountry) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do
      let(:zone) { create(:zone) }
      let(:shippable_country_attrs) { attributes_for(:shippable_country).merge(zone_id: zone.id) }

      before { post :create, shippable_country: shippable_country_attrs }

      it { is_expected.to redirect_to(admin_shippable_countries_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:shippable_country_attrs) { attributes_for(:shippable_country, :invalid) }

      before { post :create, shippable_country: shippable_country_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:shippable_country) { create(:shippable_country) }

    before { get :edit, id: shippable_country }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:shippable_country) { create(:shippable_country) }
      let(:shippable_country_attrs) { attributes_for(:shippable_country) }

      before { put :update, id: shippable_country, shippable_country: shippable_country_attrs }

      it { is_expected.to redirect_to(admin_shippable_countries_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:shippable_country) { create(:shippable_country) }
      let(:shippable_country_attrs) { attributes_for(:shippable_country, :invalid) }

      before { put :update, id: shippable_country, shippable_country: shippable_country_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:shippable_country) { create(:shippable_country) }

    before { delete :destroy, id: shippable_country }

    it { is_expected.to redirect_to(admin_shippable_countries_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
