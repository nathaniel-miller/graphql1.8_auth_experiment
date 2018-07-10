class Types::Link < Types::CarenObject
  graphql_name 'Link'

  field :id, ID, null: false
  field :url, String, null: false
  field :description, String, null: false
end