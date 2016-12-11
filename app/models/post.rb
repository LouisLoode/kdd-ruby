class Post < ApplicationRecord
  searchkick autocomplete: [:url, :message]
  belongs_to :user
  has_many :rates
  has_many :favorites, dependent: :destroy
  has_and_belongs_to_many :categories
  validates_associated :categories
  validates :url, presence: true,
                    length: { minimum: 5 }
  validates :message,
                    length: { maximum: 250 }, allow_blank: true
  validates :user_id, presence: true
  validates :category_ids, presence: true

  #self.per_page = 1
  # def average_rates
  #   rates.sum(:score) / rates.size
  # end
end
