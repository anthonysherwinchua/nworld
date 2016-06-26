RSpec.shared_examples 'admin-only controller' do
  context 'other role is logged in' do
    let(:other) { create(:user, :other_role) }

    before { sign_in other }

    it { expect(get(:index)).to redirect_to root_path }
  end
end
