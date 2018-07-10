module Resolvers
  class CreateLink < Resolvers::Base
    # return type from the mutation
    type Types::Link, null: false

    # arguments passed as "args"
    argument :description, String, required: true
    argument :url, String, required: true



    # the mutation method
    # args - are the arguments passed
    def resolve(args)
      Link.create!(
        description: args[:description],
        url: args[:url]
      )
    end
  end
end