class Event < ApplicationRecord
  validates_presence_of :start, :finish, :title, :description

  def address
    [self.street1, self.street2, self.city, self.postcode].reject{ |v| v.empty? }.join(", ")
  end

  def from_until
    full_date = "%B %e, %I:%M %p"
    time_only = "%I:%M %p"
    if self.start.to_date == self.finish.to_date
      self.start.strftime(full_date) + " — " + self.finish.strftime(time_only)
    else
      self.start.strftime(full_date) + " — " + self.finish.strftime(full_date)
    end
  end
end
