class Graphql18AuthSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
