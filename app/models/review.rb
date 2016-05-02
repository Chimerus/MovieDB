class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates :score, presence: true
  # Uncomment below to enable making comment mandatory, I chose to only make score mandatory
  # validates :comment, presence: true
end
