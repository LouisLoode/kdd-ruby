class Post < ApplicationRecord
  searchkick autocomplete: [:url, :message]
  belongs_to :user
  has_many :rates
  has_many :favorites, dependent: :destroy
  has_and_belongs_to_many :categories
  validates :url, presence: true,
                    length: { minimum: 5 }
  validates :message,
                    length: { maximum: 250 }
  validates :user_id, presence: true
  validates :category_ids, presence: true

  # def average_rates
  #   rates.sum(:score) / rates.size
  # end
end
