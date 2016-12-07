class Category < ApplicationRecord
  has_and_belongs_to_many :posts
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent_category, :class_name => "Category"

  validates :name, length: { minimum: 2 }, uniqueness: true, presence: true
  validates :description, length: { maximum: 250 }

  before_create :slugify_name
  before_update :slugify_name

  def slugify_name
    if name
       self.slug = self.name.parameterize
    end
  end
end
