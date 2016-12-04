class Post < ApplicationRecord
  has_many :ranks
  validates :url, presence: true,
                    length: { minimum: 5 }
  validates :message, presence: true,
                    length: { maximum: 250 }
end
