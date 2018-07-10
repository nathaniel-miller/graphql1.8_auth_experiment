require 'jwt'

class GraphqlController < ApplicationController
  def execute

    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]

    context = {
      # Query context goes here, for example:
      current_user: current_user
    }
    result = Graphql18AuthSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  end

  private
  # Extract the user id from the provided JWT
  def current_user
    token = request.headers['Authorization']
    decoded_token = JWT.decode token, nil, false

    current_user = User.find_by(id: decoded_token[0]["user_id"])
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
