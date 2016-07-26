class Author < ApplicationRecord
  has_many :letter_authors
  has_many :letters, through: :letter_authors
  validates_presence_of :first_name

  def name
    if self.last_name
      "#{self.first_name} #{self.last_name}"
    else
      self.first_name
    end
  end

  def last_first
    if self.last_name
      "#{self.last_name}, #{self.first_name}"
    else
      self.first_name
    end
  end
end
