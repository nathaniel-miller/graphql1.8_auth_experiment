class Types::MutationType < Types::CarenObject

  # Resolver Version
  # field :create_link, 
  #   resolver: Resolvers::CreateLink,
  #   description: "Create a special link for something."


  field :create_link, mutation: Mutations::CreateLink,
    description: "Mutate something!"

  field :create_user, mutation: Mutations::CreateUser,
    description: "Create a new User oBjEcT"

  field :sign_in_user, mutation: Mutations::SignInUser,
    description: "Sign in with an existing email and password."  
end
