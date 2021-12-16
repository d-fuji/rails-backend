# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :num, Integer, null: false
    field :content, String, null: false
    field :users, [Types::UserType], null: false
    field :marks, [Types::MarkType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    def users
      Loaders::AssociationLoader.for(User, :users).load(object)
    end

    def marks
      Loaders::AssociationLoader.for(User, :marks).load(object)
    end
  end
end
