class Match < ApplicationRecord

  NUM_MAPS = 14
  MAX_RANK = 5000

  belongs_to :user
  validates :user_id, presence: true
  validates :map, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: NUM_MAPS }
  validates :rank, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: MAX_RANK }
  validates :notes, length: { maximum: 150 }
  validates :video_link, length: { maximum: 150 }

end
