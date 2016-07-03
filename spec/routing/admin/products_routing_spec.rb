require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :routing do

  it { expect(get: '/admin/products').to route_to(controller: 'admin/products', action: 'index') }
  it { expect(get: '/admin/products/new').to route_to(controller: 'admin/products', action: 'new') }
  it { expect(get: '/admin/products/1').to route_to(controller: 'admin/products', action: 'show', id: '1') }
  it { expect(get: '/admin/products/1/edit').to route_to(controller: 'admin/products', action: 'edit', id: '1') }
  it { expect(post: '/admin/products').to route_to(controller: 'admin/products', action: 'create') }
  it { expect(patch: '/admin/products/1').to route_to(controller: 'admin/products', action: 'update', id: '1') }
  it { expect(delete: '/admin/products/1').to route_to(controller: 'admin/products', action: 'destroy', id: '1') }

end
