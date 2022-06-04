require 'rails_helper'

RSpec.describe 'Resorts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/resorts' }

    it 'should return 422 success' do
      expect(response).to have_http_status(422)
    end
  end

  describe 'GET /show' do
    before(:example) { get '/resorts' }

    it 'should return 422 success' do
      expect(response).to have_http_status(422)
    end
  end

  describe 'GET /index' do
    before(:example) do
      post '/resorts', params: {
        resort: {
          name: 'test',
          city: 'test',
          description: 'test',
          image: 'test',
          cost: 1
        }
      }
    end

    it 'should return 422 success' do
      expect(response).to have_http_status(422)
    end
  end

  describe 'DELETE /resorts' do
    before(:example) { delete '/resorts/4' }

    it 'should return 422 success' do
      expect(response).to have_http_status(422)
    end
  end
end
