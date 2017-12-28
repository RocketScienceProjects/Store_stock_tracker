require './inventoryable'

class Shirt
  include Inventoryable
  # extend ClassMethods
  attr_accessor :attributes

  def initialize(attributes)
    @attributes = attributes
  end
end

class Pant
  include Inventoryable
  attr_accessor :attributes

  def initialize(attributes)
    @attributes = attributes
  end
end


class Accessory
  include Inventoryable
  attr_accessor :attributes

  def initialize(attributes)
    @attributes = attributes
  end
end

shirt = Shirt.create(name: "MTF", size: "L")
shirt.stock_count = 10

shirt = Shirt.create(name: "MTF2", size: "L")

shirt = Shirt.create(name: "MTF", size: "M")
shirt.stock_count = 9

pant = Pant.create(name: "Jeans", size: "M")
pant.stock_count = 2

pant = Pant.create(name: "Jeans", size: "S")
pant.stock_count = 4

accessory = Accessory.create(name: "Belt", size: "M")
accessory.stock_count = 1

accessory = Accessory.create(name: "Belt", size: "L")
accessory.stock_count = 1

accessory = Accessory.create(name: "Necklace")
accessory.stock_count = 1

p Shirt.instances
Shirt.in_stock_report

