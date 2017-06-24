require 'rails_helper'

RSpec.describe Admin::AdminsController, type: :routing do

  it { expect(get: '/admin/admins').to route_to(controller: 'admin/admins', action: 'index') }
  it { expect(get: '/admin/admins/new').to route_to(controller: 'admin/admins', action: 'new') }
  it { expect(get: '/admin/admins/1').to route_to(controller: 'admin/admins', action: 'show', id: '1') }
  it { expect(get: '/admin/admins/1/edit').to route_to(controller: 'admin/admins', action: 'edit', id: '1') }
  it { expect(post: '/admin/admins').to route_to(controller: 'admin/admins', action: 'create') }
  it { expect(patch: '/admin/admins/1').to route_to(controller: 'admin/admins', action: 'update', id: '1') }
  it { expect(delete: '/admin/admins/1').to route_to(controller: 'admin/admins', action: 'destroy', id: '1') }

end
