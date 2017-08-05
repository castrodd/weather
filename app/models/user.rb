class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, confirmation: true
  validates :password, :email, presence: true
  validates :email, uniqueness: true
end
