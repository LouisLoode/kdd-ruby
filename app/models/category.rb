class Category < ApplicationRecord
  has_and_belongs_to_many :posts
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent_category, :class_name => "Category"

  validates :name, length: { minimum: 2 }, uniqueness: true, presence: true
  validates :description, length: { maximum: 250 }

  before_create :slugiy_name
  before_update :slugiy_name

  def slugiy_name
    if name
      #strip the string
      ret = self.name
      #blow away apostrophes
      ret.gsub! /['`]/,""
      # @ --> at, and & --> and
      ret.gsub! /\s*@\s*/, " at "
      ret.gsub! /\s*&\s*/, " and "
      #replace all non alphanumeric, underscore or periods with underscore
       ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'
       #convert double underscores to single
       ret.gsub! /_+/,"_"
       #strip off leading/trailing underscore
       ret.gsub! /\A[_\.]+|[_\.]+\z/,""
       ret
       self.slug = ret.downcase
    end
  end
end
