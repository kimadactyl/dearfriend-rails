class Event < ApplicationRecord
  validates_presence_of :start, :finish, :title, :description
end
