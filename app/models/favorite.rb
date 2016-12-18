class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, numericality: true, presence: true
  validates :post_id, numericality: true, presence: true

end
