class PredictionSerializer < ActiveModel::Serializer
  attributes :id,:name,:company

  has_many :emails

  def name
    object.name.humanize
  end
end
