class Student < ApplicationRecord
  has_and_belongs_to_many :books

  validates :name, presence: true
  validates :cnic, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

end
