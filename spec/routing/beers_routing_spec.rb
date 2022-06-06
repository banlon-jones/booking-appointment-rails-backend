require 'rails_helper'

RSpec.describe BeersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/beers').to route_to('beers#index')
    end

    it 'routes to #show' do
      expect(get: '/beers/1').to route_to('beers#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/beers').to route_to('beers#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/beers/1').to route_to('beers#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/beers/1').to route_to('beers#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/beers/1').to route_to('beers#destroy', id: '1')
    end
  end
end
