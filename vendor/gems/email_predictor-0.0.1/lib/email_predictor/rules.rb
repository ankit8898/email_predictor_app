# This is responsible for the prediction of existing data
module EmailPredictor
  class Rules < Base

    attr_reader :name,:username

    def initialize(opts = {})
      super
      @username = opts[:username]
      validate!
    end

    def some_fake_rule
      "Holla!"
    end

    def first_name_dot_last_name
      "#{first_name}.#{last_name}"
    end

    def first_name_dot_last_initial
      "#{first_name}.#{last_name_initial}"
    end

    def first_initial_dot_last_name
      "#{first_name_initial}.#{last_name}"
    end

    def first_initial_dot_last_initial
      "#{first_name_initial}.#{last_name_initial}"
    end

    def first_name
      @name.split(' ').first
    end

    def last_name
      @name.split(' ').last
    end

    def first_name_initial
      first_name[0,1]
    end

    def last_name_initial
      last_name[0,1]
    end

    def username_first
      @username.split('.').first
    end

    def username_last
      @username.split('.').last
    end

    def predict
      if first_name.eql?(username_first) && last_name.eql?(username_last)
        'first_name_dot_last_name'
      elsif first_name_initial.eql?(username_first) && last_name.eql?(username_last)
        'first_initial_dot_last_name'
      elsif first_name_initial.eql?(username_first) && last_name_initial.eql?(username_last)
        'first_initial_dot_last_initial'
      elsif first_name.eql?(username_first) && last_name_initial.eql?(username_last)
        'first_name_dot_last_initial'
      end
    end

    class << self
      def get(employees)
        employees.collect do |employee|
          rule = new(employee)
          rule.predict
        end.uniq
      end
    end
  end
end
