# frozen_string_literal: true

class Mark < ApplicationRecord
  belongs_to :movie, optional: true
  belongs_to :user, optional: true
  has_many :favorites
  has_many :comments
  validates :score,
            numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 5.0 },
            presence: true
  validates :content, length: { maximum: 500 }
end
