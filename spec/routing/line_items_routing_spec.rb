require 'rails_helper'

RSpec.describe LineItemsController, type: :routing do

  it { expect(post: 'line_items').to route_to(controller: 'line_items', action: 'create') }

end
