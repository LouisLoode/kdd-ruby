class Rank < ApplicationRecord
  # @TODO make validations
  validates :note, :user_id, :post_id, presence: true

end
