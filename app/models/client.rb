class Client < ApplicationRecord
  validates :name, length: { maximum: 64 }, presence: true, uniqueness: true
  validates :auth_key, length: { is: 8 }, presence: true, uniqueness: true
  has_many :messages
end
