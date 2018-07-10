class Types::QueryType < Types::CarenObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :test_field, String, null: false,
    description: "An example field added by the generator"
  def test_field
    "Hello World!"
  end

  field :all_links, [Types::Link], null: false

  def all_links
    Link.all
  end
end
