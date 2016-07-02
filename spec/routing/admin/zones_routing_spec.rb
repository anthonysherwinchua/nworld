require 'rails_helper'

RSpec.describe Admin::ZonesController, type: :routing do

  it { expect(get: '/admin/zones').to route_to(controller: 'admin/zones', action: 'index') }
  it { expect(get: '/admin/zones/new').to route_to(controller: 'admin/zones', action: 'new') }
  it { expect(get: '/admin/zones/1').to route_to(controller: 'admin/zones', action: 'show', id: '1') }
  it { expect(get: '/admin/zones/1/edit').to route_to(controller: 'admin/zones', action: 'edit', id: '1') }
  it { expect(post: '/admin/zones').to route_to(controller: 'admin/zones', action: 'create') }
  it { expect(patch: '/admin/zones/1').to route_to(controller: 'admin/zones', action: 'update', id: '1') }
  it { expect(delete: '/admin/zones/1').to route_to(controller: 'admin/zones', action: 'destroy', id: '1') }

end
