class Artist < ApplicationRecord
  validates :bio, presence: true
end
