class Category < ApplicationRecord
  has_and_belongs_to_many :posts
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent_category, :class_name => "Category"

  validates :name, length: { minimum: 2 }, uniqueness: true, presence: true
  validates :slug, presence: true
  validates :description, length: { maximum: 250 }


  def self.for_select
    Category.where(public: true, parent_id: nil).map do |category|
      [category.name, category.subcategories.map { |cat| [cat.id, cat.name] }]
    end
  end
end
