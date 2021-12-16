# frozen_string_literal: true

module Types
  class MovieType < Types::BaseObject
    field :id, ID, null: false
    field :movie_name, String, null: false
    field :movie_image, String, null: true
    field :summary, String, null: true
    field :running_time, Integer, null: false
    field :release_year, Integer, null: true
    field :release_date, GraphQL::Types::ISO8601Date, null: true
    field :country, String, null: true
    field :category, String, null: true
    field :release_state, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :clips, [Types::ClipType], null: false
    field :marks, [Types::MarkType], null: false
    def clips
      Loaders::AssociationLoader.for(User, :clips).load(object)
    end

    def marks
      Loaders::AssociationLoader.for(User, :marks).load(object)
    end
  end
end
