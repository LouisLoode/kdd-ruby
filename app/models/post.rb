class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 100}
  validates :user_id, presence: true
  validates :message, length: {maximum: 250}
  validates :url, presence: true, uniqueness: true # @TODO REGEX

  belongs_to :user
  has_many :rank

  before_create :upcase_title

  def upcase_title
    if title
      self.title =  title.slice(0,1).capitalize + title.slice(1..-1)
    end
  end

end
