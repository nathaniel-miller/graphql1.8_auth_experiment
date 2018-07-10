class Mutations::CreateUser < Mutations::BaseMutation
  graphql_name 'User'

  argument :auth_input, Types::AuthInputType, required: true

  field :email, String, null: false
  field :id, ID, null: false

  def resolve(args)
    email = args[:auth_input][:email]
    password = args[:auth_input][:email]

    User.create!(email: email, password: password)
  end
end