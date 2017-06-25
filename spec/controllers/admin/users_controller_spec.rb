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
    it { expect(assigns(:current_item)).to be_a(CreateCodeForm) }

  end

  describe 'POST #create' do

    ['retailer', 'wholesaler'].each do |tier|

      context "with valid attributes as #{tier}" do

        let(:user_attrs) { { code: 'abc123', role: tier } }

        subject { post :create, create_code_form: user_attrs }

        it { is_expected.to redirect_to(admin_users_path) }
        it { expect{ subject }.to change { User.count }.by(1) }
        it { subject; expect(User.last.roles.first.name).to eq(tier)}

      end

    end

    context 'with invalid attributes' do
      let(:user_attrs) { { code: '' } }

      before { post :create, create_code_form: user_attrs }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:current_item)).not_to be_persisted }

    end

  end

  describe 'PUT #update' do

    let(:user) { create(:user, :retailer) }

    before { put :update, id: user }

    it { is_expected.to redirect_to(admin_users_path) }
    it { expect(assigns(:current_item).errors).to be_empty }
    it { expect(assigns(:current_item).roles.first.name).to eq('wholesaler')}

  end

end
