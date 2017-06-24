require 'rails_helper'

RSpec.describe Admin::AdminsController, type: :controller do

  include_examples 'admin-only controller'

  let(:admin) { create(:user) }
  before { sign_in admin }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:admins) { create_list(:user, count) }
    let(:all_admins) { [[admin] + admins].flatten.map(&:id).sort }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items).ids.sort).to eq(all_admins) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(User) }

  end

  describe 'POST #create' do

    context 'with valid attributes' do

      let(:admin_attrs) { attributes_for(:user) }

      before { post :create, admin: admin_attrs }

      it { is_expected.to redirect_to(admin_admins_path) }
      it { expect(assigns(:current_item)).to be_persisted }

    end

    context 'with invalid attributes' do
      let(:admin_attrs) { attributes_for(:user, :invalid) }

      before { post :create, admin: admin_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:admin) { create(:user) }

    before { get :edit, id: admin }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes' do

      let(:admin) { create(:user) }
      let(:admin_attrs) { attributes_for(:user) }

      before { put :update, id: admin, admin: admin_attrs }

      it { is_expected.to redirect_to(admin_admins_path) }
      it { expect(assigns(:current_item).errors).to be_empty }

    end

    context 'with invalid attributes' do

      let(:admin) { create(:user) }
      let(:admin_attrs) { attributes_for(:user, :invalid) }

      before { put :update, id: admin, admin: admin_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

  describe 'DELETE #destroy' do

    let(:admin) { create(:user) }

    before { delete :destroy, id: admin }

    it { is_expected.to redirect_to(admin_admins_path) }
    it { expect(assigns(:current_item)).not_to be_persisted }

  end

end
