# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_mark, mutation: Mutations::CreateMark
    field :update_mark, mutation: Mutations::UpdateMark
  end
end
