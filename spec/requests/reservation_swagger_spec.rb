require 'swagger_helper'
require 'rails_helper'

describe 'Reservations API' do
  # Index
  path '/reservations' do
    get 'Retrieves reservations' do
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
        run_test!
      end
    end
  end
end
