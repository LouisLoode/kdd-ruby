class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :score, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, only_integer: true }, presence: true
  validates :user_id, numericality: true, presence: true
  validates :post_id, numericality: true, presence: true

  # scope :all_by_user, -> (user) { where(user_id: user.id)}
end
