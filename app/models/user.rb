class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation

  validates :password, confirmation: true
  validates :password, :email, presence: true
  validates :email, uniqueness: true
end
