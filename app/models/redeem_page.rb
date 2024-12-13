class RedeemPage < ApplicationRecord
  validates :name, presence: true
  validates :is_active, inclusion: { in: [true, false] }
  validates :size_options, presence: true, if: :size_options_enabled?
  validate :extra_questions_format

  has_many :redeems, dependent: :destroy

  def size_options_enabled?
    if size_options.present? && !size_options.is_a?(Array)
      errors.add(:size_options, "must be an array")
    end
  end

  def extra_questions_format
    if extra_questions.present? && extra_questions.is_a?(Array)
      extra_questions.each_with_index do |question_hash, index|
        unless question_hash.is_a?(Hash) && question_hash['question'].present?
          errors.add(:extra_questions, "Item #{index + 1} must contain a valid question")
        end
        unless question_hash.key?('answer') # 'answer' é opcional
          errors.add(:extra_questions, "Item #{index + 1} must contain an 'answer' field")
        end
      end
    elsif extra_questions.present?
      errors.add(:extra_questions, "must be an array of objects with 'question' and 'answer'")
    end
  end
end
