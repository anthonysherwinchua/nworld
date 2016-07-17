require 'rails_helper'

RSpec.describe ProductsController, type: :routing do

  it { expect(get: 'products').to route_to(controller: 'products', action: 'index') }
  it { expect(get: 'products/1').to route_to(controller: 'products', action: 'show', id: '1') }

end
