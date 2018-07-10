class Types::AuthInputType < Types::BaseInputObject
  graphql_name 'AuthorizationInput'

  argument :email, String, required: true
  argument :password, String, required: true
end