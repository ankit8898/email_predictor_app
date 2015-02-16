#This is responsible for predicting the rules on the knowledge of existing data.
# Usage

# EmailPredictor::DataAnalyser.all
# This gives the analysis for all the existing records

# To find for a particular company
# Usage
# EmailPredictor::DataAnalyser.find('google')
module EmailPredictor

  class DataAnalyser

    attr_reader :company,:rules

    def initialize(opts)
      @company = opts[:company]
      @rules   = opts[:rules]
    end

    class << self
      def all
        collection = []
        group_by_company.each_pair do |key,value|
          collection << new(company: key,rules: get_rules(value))
        end
        collection
      end


      def get_rules(employees)
        EmailPredictor::Rules.get(employees)
      end

      #Sample dataset
      #TODO: should be flexible and via a .yml or .json file
      def dataset
        {
          'John Ferguson' => 'john.ferguson@alphasights.com',
          'Damon Aw'      => 'damon.aw@alphasights.com',
          'Linda Li'      => 'linda.li@alphasights.com',
          'Larry Page'    => 'larry.p@google.com',
          'Sergey Brin'   => 's.brin@google.com',
          'Steve Jobs'    => 's.j@apple.com'
        }
      end

      def find(company)
        all.find {|i| i.company == company}
      end

      # We need to group the dataset by the company and the number of people associated with
      # it
      def group_by_company
        hsh = Hash.new
        dataset.each_pair do |key,value|
          company      = value.split('@')[1].split('.')[0] #get the company name
          username     = value.split('@')[0]
          hsh[company] ||= []
          hsh[company] << { name: key,username: username }
        end
        hsh
      end
    end
  end
end
