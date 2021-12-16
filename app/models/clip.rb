# frozen_string_literal: true

class Clip < ApplicationRecord
  belongs_to :moive, optional: true
  validates :num, numericality: { only_integer: true }
end
