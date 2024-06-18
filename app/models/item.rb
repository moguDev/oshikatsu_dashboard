class Item < ApplicationRecord
  before_validation :set_end_date_if_nil

  validates :title, presence: true, length: { maximum: 255 }
  validates :oshi, presence: true, length: { maximum: 255 }
  validates :start_date, presence: true, format: { with: VALID_DATE_REGEX }
  validates :end_date, presence: true, format: { with: VALID_DATE_REGEX }
  validate :start_date_cannot_be_in_the_past, :end_date_cannot_be_in_the_past
  validates :locate, length: { maximum: 255 }
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/, allow_nil: true, allow_blank: true
  validate :check_is_private

  belongs_to :user
  has_many :goods, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    # 全ての列を検索可能にする
    authorizable_ransackable_attributes
  end
  def self.ransackable_associations(auth_object = nil)
    # 全ての関連テーブルを検索可能にする
    authorizable_ransackable_associations
  end

  private

  def check_is_private
    errors.add(:is_private, "を選択してください") if is_private.nil?
  end

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "過去の日付は使えません")
    end
  end

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < start_date
      errors.add(:end_date, "開始日より過去の日付は使えません")
    end
  end

  def set_end_date_if_nil
    self.end_date = start_date if end_date.nil?
  end
end
