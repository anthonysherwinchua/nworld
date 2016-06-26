require 'rails_helper'

RSpec.describe Admin::CouriersController, type: :controller do

  include_examples 'admin-only controller'

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:couriers) { create_list(:courier, count) }
    let(:all_couriers) { couriers.map(&:id).sort }
    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items).ids.sort).to eq(all_couriers) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(Courier) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:courier_attrs) { attributes_for(:courier) }

      before { post :create, courier: courier_attrs }

      it { is_expected.to redirect_to(admin_couriers_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:courier_attrs) { attributes_for(:courier, :invalid) }

      before { post :create, courier: courier_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:courier) { create(:courier) }

    before { get :edit, id: courier }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:courier) { create(:courier) }
      let(:courier_attrs) { attributes_for(:courier) }

      before { put :update, id: courier, courier: courier_attrs }

      it { is_expected.to redirect_to(admin_couriers_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:courier) { create(:courier) }
      let(:courier_attrs) { attributes_for(:courier, :invalid) }

      before { put :update, id: courier, courier: courier_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:courier) { create(:courier) }

    before { delete :destroy, id: courier }

    it { is_expected.to redirect_to(admin_couriers_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
