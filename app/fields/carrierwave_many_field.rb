require "administrate/field/base"

class CarrierwaveManyField < Administrate::Field::Base
  def to_s
    data
  end
end
