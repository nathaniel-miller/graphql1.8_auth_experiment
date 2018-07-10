class Mutations::CreateLink < Mutations::BaseMutation
  null true
  graphql_name 'LinkOmatic'

  # arguments passed as "args"
  argument :description, String, required: true
  argument :url, String, required: true

  field :description, String, null: false
  field :url, String, null: false
  field :id, ID, null:false

  # the mutation method
  # args - are the arguments passed
  def resolve(args)
    Link.create!(
      description: args[:description],
      url: args[:url]
    )
  end   
end