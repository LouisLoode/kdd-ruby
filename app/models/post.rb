class Post < ApplicationRecord

  searchkick autocomplete: [:url, :message]
  belongs_to :user
  has_many :rates
  has_many :favorites, dependent: :destroy
  has_and_belongs_to_many :categories
  validates_associated :categories
  validates :url, presence: true,
                    length: { minimum: 5 },
                    format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }
  validates :message,
                    length: { maximum: 250 }, allow_blank: true
  validates :user_id, presence: true
  validates :category_ids, presence: true

  def average_ratings
    if self.total_ratings > 0
      (Rate.where(post_id: self.id).sum(:score).to_f / self.total_ratings).round(1)
    else
      return 0
    end
  end

  def total_ratings
    Rate.where(post_id: self.id).count
  end
end
