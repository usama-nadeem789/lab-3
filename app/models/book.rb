class Book < ApplicationRecord
  has_and_belongs_to_many :authors

  enum genre: { fiction: 'Fiction', non_fiction: 'Non-Fiction', mystery: 'Mystery', fantasy: 'Fantasy', science_fiction: 'Science Fiction' }

  def self.ransackable_attributes(auth_object = nil)
    ["added_by", "created_at", "id", "quantity", "rent", "title", "updated_at"]
  end
end
