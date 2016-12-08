class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :score, numericality: true, length: { minimum: 1, maximum: 5 }, presence: true
  validates :user_id, numericality: true, presence: true
  validates :post_id, numericality: true, presence: true
end
