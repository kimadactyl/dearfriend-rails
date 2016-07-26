class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  FULL_DATE = "%B %e, %I:%M %p"
  DATE_ONLY = "%B %e, %Y"
  TIME_ONLY = "%I:%M %p"
end
