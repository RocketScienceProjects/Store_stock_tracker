
require './inventory'

module Okram
  class Shirt
    include Inventory
    # extend Inventory::ClassMethods
    attr_accessor :attributes

    def initialize(attributes)
      @attributes = attributes
    end
  end

  class Pant
    include Inventory
    attr_accessor :attributes

    def initialize(attributes)
      @attributes = attributes
    end
  end
end

vh1 = Okram::Shirt.create(name: "vanHuesen", size: "L")
vh1.stock_count = 9

vh2 = Okram::Shirt.create(name: "vanHuesen", size: "M")
vh2.stock_count = 3

ae1 = Okram::Shirt.create(name: "American Eagle", size: "M")
ae1.stock_count = 0

p "The Shirt instances: #{Okram::Shirt.instances}"

pant1 = Okram::Pant.create(name: "Raymonds", size: "L" )
pant1.stock_count = 22
pant2 = Okram::Pant.create(name: "Raymonds", size: "M" )
pant2.stock_count = 0
pant3 = Okram::Pant.create(name: "Raymonds", size: "S" )
pant3.stock_count = 0

p "The Pant instances: #{Okram::Pant.instances}"


puts vh1.in_stock?
puts vh2.in_stock?
puts ae1.in_stock?

puts pant1.in_stock?
puts pant2.in_stock?
puts pant3.in_stock?

Okram::Shirt.in_stock_report
Okram::Shirt.out_of_stock_report
Okram::Pant.in_stock_report
Okram::Pant.out_of_stock_report

# [#<Shirt:0x0000000002ef8650 @attributes={:name=>"vanHuesen", :size=>"L"}, @stock_count=9>, 
# #<Shirt:0x0000000002ef8560 @attributes={:name=>"vanHuesen", :size=>"M"}, @stock_count=0>]

