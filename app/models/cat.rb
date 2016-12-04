class Cat < ApplicationRecord
  validates :name, length: { minimum: 2 }, uniqueness: true, presence: true
  validates :slug, presence: true
  validates :description, length: { maximum: 250 }
end
