class Artist < ApplicationRecord
  has_many :albums

  validates :bio, presence: true
end
