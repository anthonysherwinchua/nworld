require 'rails_helper'

RSpec.describe Admin::PackagesController, type: :routing do

  it { expect(get: '/admin/packages').to route_to(controller: 'admin/packages', action: 'index') }
  it { expect(get: '/admin/packages/new').to route_to(controller: 'admin/packages', action: 'new') }
  it { expect(get: '/admin/packages/1').to route_to(controller: 'admin/packages', action: 'show', id: '1') }
  it { expect(get: '/admin/packages/1/edit').to route_to(controller: 'admin/packages', action: 'edit', id: '1') }
  it { expect(post: '/admin/packages').to route_to(controller: 'admin/packages', action: 'create') }
  it { expect(patch: '/admin/packages/1').to route_to(controller: 'admin/packages', action: 'update', id: '1') }
  it { expect(delete: '/admin/packages/1').to route_to(controller: 'admin/packages', action: 'destroy', id: '1') }

end
