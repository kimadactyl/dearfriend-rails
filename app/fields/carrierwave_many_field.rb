require "administrate/field/base"

class CarrierwaveManyField < CarrierwaveField
  def thumb
    data.map { |d| d.url(:thumb) }
  end
end
