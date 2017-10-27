class Message < ApplicationRecord
  belongs_to :client
  validates :client_id, presence: true
  validates :content, presence: true
  validates :severity, presence: true, inclusion: { in: %w( verbose info debug warning error ) }
end
