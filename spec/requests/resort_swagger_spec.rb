require 'swagger_helper'
require 'rails_helper'

describe 'Resorts API' do

  # Index
  path '/resorts' do
    get 'Retrieves resorts' do
      tags 'Resorts'
      produces 'application/json'
      response '200', 'resort found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 city: { type: :string },
                 country: { type: :string },
                 image: { type: :string },
                 description: { type: :string },
                 cost: { type: :number },
                 created_at: { type: :datetime },
                 updated_at: { type: :datetime },
                 isDeleted: { type: :boolean }
               },
               required: %w[id name city country image cost created_at updated_at isDeleted]
        run_test!
      end
    end
  end


end
