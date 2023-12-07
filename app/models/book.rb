class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :students
  has_and_belongs_to_many :genres

  validates :title, presence: true, uniqueness: true
  validates :quantity, presence: true
  # validate :at_least_one_author_selected
  # validate :at_least_one_genre_selected

  validates :quantity, numericality: { greater_than_or_equal_to: 0}

  # enum genre: { fiction: 'Fiction', non_fiction: 'Non-Fiction', mystery: 'Mystery', fantasy: 'Fantasy', science_fiction: 'Science Fiction' }

  def self.ransackable_attributes(auth_object = nil)
    ["quantity", "title"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["authors", "genres", "students"]
  end

  # private

  # def at_least_one_author_selected
  #   errors.add(:authors, "must have at least one selected") if authors.empty?
  # end

  # def at_least_one_genre_selected
  #   errors.add(:genres, "must have at least one selected") if genres.empty?
  # end

end
