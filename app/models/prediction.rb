class Prediction < ActiveRecord::Base

  has_many :emails

  def predict_and_save
    prediction = EmailPredictor::Predictor.predict(name: name,company: company)

    if prediction.predicted_emails.present?
      prediction.predicted_emails.each do |email|
        emails << Email.new(email: email)
      end
      save!
    else
      errors[:prediction] = prediction.message
      false
    end
  end
end
