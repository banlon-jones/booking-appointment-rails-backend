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

  # Show
  path '/resorts/{id}' do
    get 'Retrieves a resort' do
      tags 'Resorts'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

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

      response '404', 'Resorts not found' do
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
  path '/resorts' do
    post 'Creates a resort' do
      tags 'Resorts'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :resort, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          city: { type: :string },
          country: { type: :string },
          image: { type: :string },
          description: { type: :string },
          cost: { type: :number },
          isDeleted: { type: :boolean }
        },
        required: %w[name city country image cost isDeleted]
      }

      response '201', 'resort created' do
        run_test!
      end
    end
  end

  # Update
  path '/resorts/{id}' do
    patch 'Update a resort' do
      tags 'Resorts'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      security [Bearer: {}]
      parameter name: :resort, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          city: { type: :string },
          country: { type: :string },
          image: { type: :string },
          description: { type: :string },
          cost: { type: :number },
          isDeleted: { type: :boolean }
        },
        required: %w[name city country image cost isDeleted]
      }

      response '200', 'resort Updated' do
        run_test!
      end
    end
  end

  # Destroy
  path '/resorts/{id}' do
    delete 'Delete a resort' do
      tags 'Resorts'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      security [Bearer: {}]
      response '200', 'resort delected' do
        run_test!
      end
    end
  end
end
