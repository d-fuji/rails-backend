module Mutations
  class Login < GraphqlDevise::Mutations::Login
    field :user, Types::UserType, null: true

    def resolve(email:, password:)
      original_payload = super do |user|
        user.reload
      end
      if original_payload
        original_payload.merge(user: original_payload[:authenticatable])
      else
        build_errors(user)
        return
      end
    end

    def build_errors(user)
      user.errors.map do |attr, message|
        message = user[attr] + ' ' + message
        context.add_error(GraphQL::ExecutionError.new(message, extensions: { code: 'USER_INPUT_ERROR', attribute: attr }))
      end
    end
  end
end

