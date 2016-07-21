class Author < ApplicationRecord
  has_many :letter_authors
  has_many :letters, through: :letter_authors
  validates_presence_of :first_name

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
