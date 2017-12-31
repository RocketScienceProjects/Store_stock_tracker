module Inventory

  def self.included(klass)
    klass.extend(ClassMethods)
    # klass.extend(Enumerable) this is not required
  end

  module ClassMethods
    
    def instances
      @instances ||= []
    end
    
    def create(attributes)
      object = new(attributes)
      instances.push(object)
      object
    end

    def each(&block)
      instances.each(&block)
    end

    def report(report_type, reportables)
      puts report_type
      reportables.each do |instance|
        line = []
        line.push(instance.attributes[:name])
        line.push(instance.stock_count)
        if instance.attributes.include?(:size)
          line.push(instance.attributes[:size])
        end
        puts line.join("\t")
      end
      puts "\n"
    end


    def in_stock_report
      report_type = "In stock report for #{self}..."
      reportables = instances.select { |instance| instance.in_stock? }
      report(report_type, reportables)
    end

    def out_of_stock_report
      report_type = "Out of stock report for #{self}..."
      reportables = instances.select { |instance| !instance.in_stock? }
      report(report_type, reportables)
    end
  end


  def stock_count
    @stock_count ||= 0
  end

  def stock_count=(num)
    @stock_count = num
  end


  def in_stock?
    @stock_count > 0
  end

end