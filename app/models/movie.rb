class Movie < ApplicationRecord
  # when movie deleted, its reviews are too
  has_many :reviews, dependent: :destroy

  # Auto-generate the friendly_url! Culling all symbols.
  # Potential problem, may not have a unique "friendly url" Maybe add a movie year? But not in provided project parameters
  before_create {generate_url(:friendly_url)}
  def generate_url(column)
      self[column] = self.title.downcase.gsub(/[^a-zA-Z0-9\s]/, "").gsub(/[\s]/, "_")
  end

end