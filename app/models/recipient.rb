class Recipient < ApplicationRecord
  has_many :letter_recipients
  has_many :letters, through: :letter_recipients

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def is_living?
    !!self.died
  end

  def last_first
    if self.last_name
      "#{self.last_name}, #{self.first_name}"
    else
      self.first_name
    end
  end
end
