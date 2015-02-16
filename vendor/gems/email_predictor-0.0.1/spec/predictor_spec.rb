describe EmailPredictor::Predictor do

  describe "Predict Emails for alphasights employees" do
    subject {EmailPredictor::Predictor.new(name: 'Peter Wong',company: 'alphasights')}

    before do
      allow(subject).to receive(:applicable_rules).and_return(['first_name_dot_last_name'])

    end

    it 'should predict the Emails' do
      expect(subject.predicted_emails).to be_empty
      subject.predict
      expect(subject.predicted_emails).to match_array(['peter.wong@alphasights.com'])
      expect(subject.message).to eq('Successfully predicted emails.')
    end
  end

  describe "Predict Emails for google employees" do
    subject {EmailPredictor::Predictor.new(name: 'Craig Silverstein',company: 'google')}

    before do
      allow(subject).to receive(:applicable_rules).and_return(['first_name_dot_last_initial','first_initial_dot_last_name'])
    end

    it 'should predict the Emails' do
      expect(subject.predicted_emails).to be_empty
      subject.predict
      expect(subject.predicted_emails).to match_array(['craig.s@google.com','c.silverstein@google.com'])
      expect(subject.message).to eq('Successfully predicted emails.')
    end
  end

  describe "Predict Emails for apple employees" do
    subject {EmailPredictor::Predictor.new(name: 'Steve Wozniak',company: 'apple')}

    before do
      allow(subject).to receive(:applicable_rules).and_return(['first_initial_dot_last_initial'])
    end

    it 'should predict the Emails' do
      expect(subject.predicted_emails).to be_empty
      subject.predict
      expect(subject.predicted_emails).to match_array(['s.w@apple.com'])
      expect(subject.message).to eq('Successfully predicted emails.')
    end
  end

  describe "Predict Emails for whitehouse employees" do
    subject {EmailPredictor::Predictor.new(name: 'Barack Obama',company: 'whitehouse')}

    before do
      allow(subject).to receive(:applicable_rules).and_return([])
    end

    it 'should predict the Emails' do
      expect(subject.predicted_emails).to be_empty
      subject.predict
      expect(subject.predicted_emails).to be_empty
      expect(subject.message).to eq("Prediction cannot be done for Barack Obama as we don't have any historical data for whitehouse company.")
    end
  end

  describe  "Handle when wrong parameters are probi" do
  end
end
