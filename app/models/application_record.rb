class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates:title, presence:true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: { maximum: 500 }
  validate :end_date_after_start_date

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "は開始日以降の日付を入力してください")
    end
  end
end
