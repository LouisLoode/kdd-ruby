class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: /\w*@\w*\.\w*/ }, uniqueness: true


end
