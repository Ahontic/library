# defining Reader class
class Reader < Base
  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    validate(name, email, city, street, house)
  end

  private

  def validate(name, email, city, street, house)
    arr = [name, email, city, street]
    arr.each do |item|
      validate_class(item, String)
      validate_empty(item)
    end
    validate_class(house, Integer)
  end
end
