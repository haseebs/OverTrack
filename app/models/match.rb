class Match < ApplicationRecord

  belongs_to :user
  has_many :heros, dependent: :destroy
  accepts_nested_attributes_for :heros

  before_validation :set_wld
  before_validation :set_rank_change
  before_save :set_streaks

  NUM_MAPS = 14
  MAX_RANK = 5000

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :map, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: NUM_MAPS }
  validates :rank, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: MAX_RANK }
  validates :notes, length: { maximum: 150 }
  validates :video_link, length: { maximum: 150 }

  def prev_match
    @prev_match ||= Match.find_by(user_id: user_id)
  end

  def calculate_rank_change
    return 0 if prev_match.nil?
    return rank - prev_match.rank
  end

  #fix draw assigned to first match
  def set_wld
    self.wld = 1 if calculate_rank_change > 0
    self.wld = 2 if calculate_rank_change < 0
    self.wld = 3 if calculate_rank_change == 0
  end

  def set_rank_change
    self.rank_change = calculate_rank_change
  end

  def set_streaks
    if prev_match.nil?
      if self.wld == 1
        self.winstreak = 1
        self.losestreak = 0
      elsif self.wld == 2
        self.winstreak = 0
        self.losestreak = 1
      elsif self.wld == 3
        self.winstreak = 0
        self.losestreak = 0
      end
      return
    end

    if (prev_match.wld == 1 && self.wld == 1) || (prev_match.wld == 2 && self.wld == 1) || (prev_match.wld == 3 && self.wld == 1)
      self.winstreak = prev_match.winstreak + 1
      self.losestreak = 0
    elsif (prev_match.wld == 2 && self.wld == 2) || (prev_match.wld == 1 && self.wld == 2) || (prev_match.wld == 3 && self.wld == 2)
      self.winstreak = 0
      self.losestreak = prev_match.losestreak + 1
    elsif self.wld == 3
      self.winstreak = prev_match.winstreak
      self.losestreak = prev_match.losestreak
    end
  end
end
