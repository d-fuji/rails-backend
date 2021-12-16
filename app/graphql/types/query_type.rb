# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :movie, resolver: Resolvers::MovieResolver
    field :movies, resolver: Resolvers::MovieAllResolver
    field :all_categories, resolver: Resolvers::MovieCategoriesResolver
    field :public_user, resolver: Resolvers::PublicUser
    field :users, resolver: Resolvers::UserAllResolver
    field :mark, resolver: Resolvers::MarkResolver
  end
end
