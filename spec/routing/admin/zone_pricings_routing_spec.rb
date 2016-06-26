require 'rails_helper'

RSpec.describe Admin::ZonePricingsController, type: :routing do

  it { expect(get: '/admin/zone_pricings').to route_to(controller: 'admin/zone_pricings', action: 'index') }
  it { expect(get: '/admin/zone_pricings/new').to route_to(controller: 'admin/zone_pricings', action: 'new') }
  it { expect(get: '/admin/zone_pricings/1').to route_to(controller: 'admin/zone_pricings', action: 'show', id: '1') }
  it { expect(get: '/admin/zone_pricings/1/edit').to route_to(controller: 'admin/zone_pricings', action: 'edit', id: '1') }
  it { expect(post: '/admin/zone_pricings').to route_to(controller: 'admin/zone_pricings', action: 'create') }
  it { expect(patch: '/admin/zone_pricings/1').to route_to(controller: 'admin/zone_pricings', action: 'update', id: '1') }
  it { expect(delete: '/admin/zone_pricings/1').to route_to(controller: 'admin/zone_pricings', action: 'destroy', id: '1') }

end
