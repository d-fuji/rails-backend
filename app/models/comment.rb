# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :mark
  validates :content, length: { maximum: 500 }
  validates :num, numericality: { only_integer: true }
end
