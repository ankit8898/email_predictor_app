class User < ActiveRecord::Base

  def self.seed
    10.times do |i|
      create!(name: "Ankit #{i}")
    end
  end
end
