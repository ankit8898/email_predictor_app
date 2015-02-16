module EmailPredictor
  class Base

    attr_reader :name

    def initialize(opts)
      @name = opts[:name].downcase
    end

    #Validate that the name should be in format of firstname lastname
    def validate!
      unless @name.split(" ").count.eql?(2)
        raise TypeError.new("Oops, the name is not in valid format.  Should be like 'Firstname lastname', Eg: John Ferguson")
      end
    end
  end
end
