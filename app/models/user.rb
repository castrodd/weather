class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :email, :password, :password_confirmation

  validates :password, confirmation: true
  validates :password, :email, presence: true
  validates :email, uniqueness: true
end
