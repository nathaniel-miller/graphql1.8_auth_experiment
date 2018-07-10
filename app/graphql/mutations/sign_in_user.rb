require 'jwt'

class Mutations::SignInUser < Mutations::BaseMutation
  argument :auth_input, Types::AuthInputType, required: true
    graphql_name 'User_Sign_In_'

    field :token, String, null: false
    field :user, Types::UserType, null: false

  def resolve(args)
    email = args[:auth_input][:email]

    # basic validation
    return unless email

    user = User.find_by email: email

    # ensures we have the correct user
    return unless user
    return unless user.valid_password?(args[:auth_input][:password])

    hmac_secret = "my$ecretK3y"
    payload = { 
      user_id: user.id,
      exp_date: "4923059832"
    }
    token = JWT.encode payload, hmac_secret, 'HS256'

    {
      user: user,
      token: token
    }
  end
end