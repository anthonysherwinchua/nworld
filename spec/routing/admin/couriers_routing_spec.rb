require 'rails_helper'

RSpec.describe Admin::CouriersController, type: :routing do

  it { expect(get: '/admin/couriers').to route_to(controller: 'admin/couriers', action: 'index') }
  it { expect(get: '/admin/couriers/new').to route_to(controller: 'admin/couriers', action: 'new') }
  it { expect(get: '/admin/couriers/1').to route_to(controller: 'admin/couriers', action: 'show', id: '1') }
  it { expect(get: '/admin/couriers/1/edit').to route_to(controller: 'admin/couriers', action: 'edit', id: '1') }
  it { expect(post: '/admin/couriers').to route_to(controller: 'admin/couriers', action: 'create') }
  it { expect(patch: '/admin/couriers/1').to route_to(controller: 'admin/couriers', action: 'update', id: '1') }
  it { expect(delete: '/admin/couriers/1').to route_to(controller: 'admin/couriers', action: 'destroy', id: '1') }

end
