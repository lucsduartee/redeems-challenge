class Redeem < ApplicationRecord
  validates :redeem_page_id, presence: true
  validates :user_id, presence: true
  validates :status, inclusion: { in: ['pending', 'approved', 'rejected'] }
  validate :data_format

  belongs_to :redeem_page
  belongs_to :user

  def data_format
    if data.present? && data.is_a?(Hash)
      required_keys = ['cep', 'rua', 'numero', 'bairro', 'cidade', 'estado']
      required_keys.each do |key|
        unless data.key?(key) && data[key].is_a?(String) && data[key].present?
          errors.add(:data, "must contain the '#{key}' key with a non-empty string value")
        end
      end

      ['complemento', 'pais', 'name', 'cpf', 'email'].each do |key|
        if data.key?(key) && !data[key].is_a?(String)
          errors.add(:data, "if present, the '#{key}' key must have a string value")
        end
      end
    else
      errors.add(:data, "must be a hash")
    end
  end
end
