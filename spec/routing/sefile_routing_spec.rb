require 'rails_helper'

RSpec.describe 'SefileController', type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: "/sefile/show").to route_to("sefile#show")
    end
  end
end
