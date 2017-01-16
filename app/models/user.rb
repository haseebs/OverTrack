class User < ApplicationRecord
  has_many :matches,         dependent: :destroy
  has_many :group_stats,     dependent: :destroy
  has_many :hero_stats,      dependent: :destroy
  has_many :map_stats,       dependent: :destroy
  has_many :map_hero_stats,  dependent: :destroy
  has_many :time_stats,      dependent: :destroy
  has_one :summaries,        dependent: :destroy
  before_save { email.downcase! }

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  #Cannot start with a number
  #3-12 word characters
  #followed by #
  #folowed by 2-10 digits
  BATTLETAG_REGEX = /\A\D\w{2,11}#\d{2,10}\z/

  validates :battletag, presence: true, length: { maximum: 25 },
                        format: { with: BATTLETAG_REGEX },
                        uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
end
