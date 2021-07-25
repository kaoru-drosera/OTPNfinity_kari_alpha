require 'rails_helper'

RSpec.describe 'StaticPageController', type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: "/static_page/index").to route_to("static_page#index")
    end
  end
end
