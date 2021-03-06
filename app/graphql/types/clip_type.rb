# frozen_string_literal: true

module Types
  class ClipType < Types::BaseObject
    field :id, ID, null: false
    field :num, Integer, null: false
    field :movie, [Types::MovieType], null: false
    field :user, [Types::UserType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
