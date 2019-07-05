class Course < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :locations
  belongs_to :coordinator, required: false
  has_many :votes
  
  validates :name, presence: true, length: { minimum: 10 }
  validates :prerequisite, presence: true, length: { minimum: 10 }
  validates :description, presence: true, length: { minimum: 30 }
end
