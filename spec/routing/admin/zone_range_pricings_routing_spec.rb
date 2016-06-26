require 'rails_helper'

RSpec.describe Admin::ZoneRangePricingsController, type: :routing do

  it { expect(get: '/admin/zone_range_pricings').to route_to(controller: 'admin/zone_range_pricings', action: 'index') }
  it { expect(get: '/admin/zone_range_pricings/new').to route_to(controller: 'admin/zone_range_pricings', action: 'new') }
  it { expect(get: '/admin/zone_range_pricings/1').to route_to(controller: 'admin/zone_range_pricings', action: 'show', id: '1') }
  it { expect(get: '/admin/zone_range_pricings/1/edit').to route_to(controller: 'admin/zone_range_pricings', action: 'edit', id: '1') }
  it { expect(post: '/admin/zone_range_pricings').to route_to(controller: 'admin/zone_range_pricings', action: 'create') }
  it { expect(patch: '/admin/zone_range_pricings/1').to route_to(controller: 'admin/zone_range_pricings', action: 'update', id: '1') }
  it { expect(delete: '/admin/zone_range_pricings/1').to route_to(controller: 'admin/zone_range_pricings', action: 'destroy', id: '1') }

end
