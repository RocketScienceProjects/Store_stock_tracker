module Inventoryable

  def self.included(klass)
    klass.extend(ClassMethods)
    klass.extend(Enumerable)
  end

  module ClassMethods
    def create(attributes)
      object = new(attributes)
      instances.push(object)
      return object
    end

    def instances
      @instances ||= []
    end

    def each(&block)
      instances.each(&block)
    end
    
    def in_stock_report
      puts "#{self.to_s} in stock report"
      reportable = instances.select { |instance| instance.in_stock? }
      reportable.each do |item|
        line = []
        line.push("Item: #{item.attributes[:name]}")
        line.push("Stock: #{item.stock_count}")
        if item.attributes.include?(:size)
          line.push("Size: #{item.attributes[:size]}")
        end
        puts line.join("\t")
      end
      puts "\n"
    end    
  end


  def stock_count
    @stock_count ||= 0
  end

  def stock_count=(num)
    @stock_count = num
  end

  def in_stock?
    stock_count > 0
  end
end