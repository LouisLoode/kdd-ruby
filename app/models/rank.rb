class Rank < ApplicationRecord
  validates :note, :user_id, :post_id, presence: true
  validates :note

end
