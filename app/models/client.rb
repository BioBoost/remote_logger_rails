class Client < ApplicationRecord
  validates :name, length: { maximum: 64 }, presence: true, uniqueness: true
  validates :auth_key, length: { is: 8 }, presence: true, uniqueness: true
  has_many :messages, dependent: :destroy

  def number_of_errors
    return messages.where(:severity => :error).count
  end

  def number_of_warnings
    return messages.where(:severity => :warning).count
  end

  def number_of_messages
    return messages.count
  end
end
