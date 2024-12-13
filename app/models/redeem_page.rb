class RedeemPage < ApplicationRecord
  validates :name, presence: true
  validates :is_active, inclusion: { in: [true, false] }
  validates :size_options, presence: true, if: :size_options_enabled?
  validates :extra_questions, presence: true, if: :extra_questions_enabled?

  has_many :redeems, dependent: :destroy

  def size_options_enabled?
    if size_options.present? && !size_options.is_a?(Array)
      errors.add(:size_options, "must be an array")
    end
  end

  def extra_questions_enabled?
    extra_questions.present?
  end
end
