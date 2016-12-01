class Post < ApplicationRecord
  validates :title, :url, :user_id, presence: true
  validates :url, format: { with: /\[http]*@\w*\.\w*/ }, uniqueness: true

  before_create :upcase_title

  def upcase_title
    if title
      self.title =  title.slice(0,1).capitalize + title.slice(1..-1)
    end
  end

end
