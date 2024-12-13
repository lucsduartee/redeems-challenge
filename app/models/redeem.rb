class Redeem < ApplicationRecord
  validates :redeem_page_id, presence: true
  validates :user_id, presence: true
  validates :status, inclusion: { in: ['pending', 'approved', 'rejected'] }

  belongs_to :redeem_page
  belongs_to :user
end
