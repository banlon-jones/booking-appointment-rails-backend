require 'swagger_helper'
require 'rails_helper'

describe 'Users API' do
  # Signup
  path '/auth/register' do
    post 'Register a new user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string }
        },
        required: %w[name city country image cost isDeleted]
      }
      response '201', 'user created' do
        run_test!
      end
    end
  end

 
end
