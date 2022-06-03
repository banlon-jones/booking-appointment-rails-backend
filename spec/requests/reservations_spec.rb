require 'rails_helper'

RSpec.describe "Reservations", type: :request do
  reservation = Reservation.new(
    resort_id: 'resort.id',
    date_from: '2022-07-09',
    date_to: '2022-07-15'
  )

  describe 'GET /index' do
    before(:example) { get '/reservations' }

    it 'should returns http 422 success' do
      expect(response).to have_http_status(422)
    end
  end

  describe 'GET /show' do
    before(:example) { get '/reservations' }

    it 'should returns http 422 success' do
      expect(response).to have_http_status(422)
    end
  end

  describe 'Post /create' do
    before(:example) do
      post '/reservations', params: {
        reservation: {
          resort_id: '1',
          date_from: '2022-07-09',
          date_to: '2022-07-15'
        }
      }
    end

    it 'should returns http 422 created' do
      expect(response).to have_http_status(422)
    end
  end
end
