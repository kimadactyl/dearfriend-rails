class Event < ApplicationRecord
  validates_presence_of :start, :finish, :title, :description

  def address
    if self.street1 || self.street2 || self.city || self.postcode
      [self.street1, self.street2, self.city, self.postcode].reject{ |v| v.empty? }.join(", ")
    end
  end

  def from_until
    if self.start.to_date == self.finish.to_date
      self.start.strftime(FULL_DATE) + " — " + self.finish.strftime(TIME_ONLY)
    else
      self.start.strftime(FULL_DATE) + " — " + self.finish.strftime(FULL_DATE)
    end
  end

end
