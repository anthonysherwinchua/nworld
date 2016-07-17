require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'GET #index' do

    before { get :index }

    it { is_expected.to render_template(:index) }

  end

  describe 'GET #show' do

    let(:product) { create(:product, :published) }

    before { get :show, id: product.id }

    it { is_expected.to render_template(:show) }

  end

end
