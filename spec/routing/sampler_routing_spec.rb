require 'rails_helper'

RSpec.describe 'SamplerController', type: :routing do
  describe 'routing' do
    it 'routes to #save' do
      expect(get: "/sampler/save").to route_to("sampler#save")
    end
    it 'routes to #show' do
      expect(get: "/sampler/show").to route_to("sampler#show")
    end
  end
end
