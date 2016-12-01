class Follower < ApplicationRecord
  validates :user_id, presence: true
  belongs_to :user

  def add(user_id)
    follows[:user_id].push(user_id)
  end

end
