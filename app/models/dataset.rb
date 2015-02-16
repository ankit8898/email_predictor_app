class Dataset < ActiveRecord::Base


  def self.seed
    EmailPredictor::DataAnalyser.dataset.each_pair do |key,value|
      create!(name: key,email:  value)
    end
  end
end
