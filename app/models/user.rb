class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, confirmation: true
  validates :password, length: {minimum: 8}
  validates :password, :email, :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_many :places
end
