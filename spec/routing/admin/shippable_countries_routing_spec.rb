require 'rails_helper'

RSpec.describe Admin::ShippableCountriesController, type: :routing do

  it { expect(get: '/admin/shippable_countries').to route_to(controller: 'admin/shippable_countries', action: 'index') }
  it { expect(get: '/admin/shippable_countries/new').to route_to(controller: 'admin/shippable_countries', action: 'new') }
  it { expect(get: '/admin/shippable_countries/1').to route_to(controller: 'admin/shippable_countries', action: 'show', id: '1') }
  it { expect(get: '/admin/shippable_countries/1/edit').to route_to(controller: 'admin/shippable_countries', action: 'edit', id: '1') }
  it { expect(post: '/admin/shippable_countries').to route_to(controller: 'admin/shippable_countries', action: 'create') }
  it { expect(patch: '/admin/shippable_countries/1').to route_to(controller: 'admin/shippable_countries', action: 'update', id: '1') }
  it { expect(delete: '/admin/shippable_countries/1').to route_to(controller: 'admin/shippable_countries', action: 'destroy', id: '1') }

end
