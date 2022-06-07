require 'swagger_helper'
require 'rails_helper'

describe 'Resorts API' do
  let(:access_token) { 'eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MX0.TEtXvT29xph6s8cOeb5O3ko1cNj6gA6alr7ZOy4RCg0' }
  let(:Authorization) { "Bearer #{access_token}" }

  # Index
  path '/reservations' do
    get 'Retrieves a reservation' do
      tags 'Reservations'
      produces 'application/json'
      security [Bearer: {}]

      response '200', 'reservation found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 date_from: { type: :datatime },
                 date_to: { type: :datatime },
                 user_id: { type: :integer },
                 resort_id: { type: :integer }
               },
               required: %w[id date_from date_to user_id resort_id]
        run_test!
      end

      response '404', 'Reservations not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end

  # Create
  path '/reservations' do
    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :resort, in: :body, schema: {
        type: :object,
        properties: {
          date_from: { type: :datatime },
          date_to: { type: :datatime },
          resort_id: { type: :integer }
        },
        required: %w[date_from date_to resort_id]
      }

      response '201', 'reservation created' do
        let(:reservation) { { date_from: '2022-10-4', date_to: '2022-12-4', user_id: 1, resort_id: 1} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { name: 'foo' } }
        run_test!
      end
    end
  end
end
