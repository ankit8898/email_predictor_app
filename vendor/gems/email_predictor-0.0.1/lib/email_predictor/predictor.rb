#This is reponsible for the call to the engine.
# A sample usage can look like

# EmailPredictor::Predictor.predict(name: 'Ankit Gupta',company: 'google')

module EmailPredictor
  class Predictor < Base

    attr_reader :company,:predicted_emails,:message

    def initialize(opts = {})
      super
      @company          = opts[:company]
      @predicted_emails = []
      validate!
    end

    class << self
      def predict(opts)
        obj = new(opts).predict
        obj
      end
    end

    def predict
      obj = EmailPredictor::Rules.new(name: @name)
      unless applicable_rules.empty?
        applicable_rules.collect do |rule|
          @predicted_emails << "#{obj.send(rule)}@#{@company}.com"
          @message = 'Successfully predicted emails.'
        end
      else
        @message = "Prediction cannot be done for #{@name.titleize} as we don't have any historical data for #{@company} company."
      end
      self
    end

    def applicable_rules
      EmailPredictor::DataAnalyser.find(@company).rules
    end
  end
end
