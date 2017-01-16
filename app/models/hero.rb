class Hero < ApplicationRecord
  belongs_to :match
  validates :hero, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 24 }
end
