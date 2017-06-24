require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  include_examples 'admin-only controller'

  let(:admin) { create(:user) }
  before { sign_in admin }

  describe 'GET #index' do
    let(:count) { 3 }
    let!(:admins) { create_list(:user, count) }
    let!(:non_admin_1) { create(:user, :retailer) }
    let!(:non_admin_2) { create(:user, :wholesaler) }
    let(:all_non_admins) { [non_admin_1.id, non_admin_2.id] }

    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:current_items).ids.sort).to eq(all_non_admins) }

  end

  describe 'GET #new' do

    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:current_item)).to be_new_record }
    it { expect(assigns(:current_item)).to be_a_new(User) }

  end

  describe 'POST #create' do

    context 'with valid attributes as retailer' do

      let(:user_attrs) { { code: 'abc123', role_ids: 'retailer' } }

      before { post :create, user: user_attrs }

      it { is_expected.to redirect_to(admin_users_path) }
      it { expect(assigns(:current_item)).to be_persisted }
      it { expect(assigns(:current_item).roles.first.name).to eq('retailer')}

    end

    context 'with valid attributes as wholesaler' do

      let(:user_attrs) { { code: 'abc123', role_ids: 'wholesaler' } }

      before { post :create, user: user_attrs }

      it { is_expected.to redirect_to(admin_users_path) }
      it { expect(assigns(:current_item)).to be_persisted }
      it { expect(assigns(:current_item).roles.first.name).to eq('wholesaler')}

    end

    context 'with invalid attributes' do
      let(:user_attrs) { { code: '' } }

      before { post :create, user: user_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'GET #edit' do

    let(:user) { create(:user, :retailer) }

    before { get :edit, id: user }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:current_item)).to be }

  end

  describe 'PUT #update' do

    context 'with valid attributes as retailer' do

      let(:user) { create(:user, :retailer) }
      let(:user_attrs) { { code: 'def456', role_ids: 'wholesaler' } }

      before { put :update, id: user, user: user_attrs }

      it { is_expected.to redirect_to(admin_users_path) }
      it { expect(assigns(:current_item).errors).to be_empty }
      it { expect(assigns(:current_item).roles.first.name).to eq('wholesaler')}

    end

    context 'with valid attributes as wholesaler' do

      let(:user) { create(:user, :wholesaler) }
      let(:user_attrs) { { code: 'def456', role_ids: 'retailer' } }

      before { put :update, id: user, user: user_attrs }

      it { is_expected.to redirect_to(admin_users_path) }
      it { expect(assigns(:current_item).errors).to be_empty }
      it { expect(assigns(:current_item).roles.first.name).to eq('retailer')}

    end

    context 'with invalid attributes' do

      let(:user) { create(:user, :retailer) }
      let(:user_attrs) { { code: '' } }

      before { put :update, id: user, user: user_attrs }

      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:current_item).errors).to be }

    end

  end

end
