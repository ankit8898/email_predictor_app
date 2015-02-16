describe EmailPredictor::Rules do

  subject {EmailPredictor::Rules.new(name: 'John Ferguson',username: 'john.f')}

  it "should say holla!" do
    expect(subject.some_fake_rule).to eq("Holla!")
  end

  describe 'first name' do
    it 'should return first name' do
      expect(subject.first_name).to eq('john')
    end
  end

  describe 'last name' do
    it 'should return last name' do
      expect(subject.last_name).to eq('ferguson')
    end
  end

  describe 'first name initial' do
    it 'should return first name initial' do
      expect(subject.first_name_initial).to eq('j')
    end
  end

  describe 'last initial' do
    it 'should return last name initial' do
      expect(subject.last_name_initial).to eq('f')
    end
  end

  describe 'username first' do
    it 'should return first username' do
      expect(subject.username_first).to eq('john')
    end
  end

  describe 'username last' do
    it 'should return last username' do
      expect(subject.username_last).to eq('f')
    end
  end

  describe "return the username" do

    it "should return as per rule first_name_dot_last_name" do
      expect(subject.first_name_dot_last_name).to eq("john.ferguson")
    end

    it "should return as per rule first_name_dot_last_initial" do
      expect(subject.first_name_dot_last_initial).to eq("john.f")
    end

    it "should return as per rule first_initial_dot_last_name" do
      expect(subject.first_initial_dot_last_name).to eq("j.ferguson")
    end

    it "should return as per rule first_initial_dot_last_initial" do
      expect(subject.first_initial_dot_last_initial).to eq("j.f")
    end

    describe "Exception handling" do
      #let(:rule)
      it "should raise error when a single string is given" do
        expect {EmailPredictor::Rules.new(name: 'thisisjustsomething')}.to raise_error("Oops, the name is not in valid format.  Should be like 'Firstname lastname', Eg: John Ferguson")
      end

      it "should raise error when a first name, middle name & last name is given" do
        expect {EmailPredictor::Rules.new(name: 'foo bar baz')}.to raise_error("Oops, the name is not in valid format.  Should be like 'Firstname lastname', Eg: John Ferguson")
      end
    end
  end

  describe 'Predict rule' do

    describe 'when first name, last name == username first, username last' do
      subject {EmailPredictor::Rules.new(name: 'John Ferguson',username: 'john.ferguson')}
      it 'should predict the rule when' do
        expect(subject.predict).to eq('first_name_dot_last_name')
      end
    end


    describe 'when first name initial, last name == username first, username last' do
      subject {EmailPredictor::Rules.new(name: 'John Ferguson',username: 'j.ferguson')}
      it 'should predict the rule when' do
        expect(subject.predict).to eq('first_initial_dot_last_name')
      end
    end

    describe 'when first name initial, last name initial == username first, username last' do
      subject {EmailPredictor::Rules.new(name: 'John Ferguson',username: 'j.f')}
      it 'should predict the rule when' do
        expect(subject.predict).to eq('first_initial_dot_last_initial')
      end
    end

    describe 'when first name, last name initial == username first, username last' do
      subject {EmailPredictor::Rules.new(name: 'John Ferguson',username: 'john.f')}
      it 'should predict the rule when' do
        expect(subject.predict).to eq('first_name_dot_last_initial')
      end
    end

    describe 'Get rules' do

      subject {EmailPredictor::Rules}
      let(:alphasights_employees) {
        [
          {
            name:  'John Ferguson',
            username: 'john.ferguson'
          },
          {
            name:  'Damon Aw',
            username: 'damon.aw'
          },
          {
            name: 'Linda Li',
            username:  'linda.li'
          }
        ]
      }
      let(:google_employees) {
        [
          {
            name:  'Larry Page',
            username:  'larry.p'
          },
          {
            name: 'Sergey Brin',
            username:  's.brin'
          }
        ]
      }

      let(:apple_employees) {
        [
          {
            name: 'Steve Jobs',
            username: 's.j'
          }
        ]
      }
      it 'should extract the rules for alphasights_employees' do
        expect(subject.get(alphasights_employees)).to match_array(['first_name_dot_last_name'])
      end

      it 'should extract the rules for google_employees' do
        expect(subject.get(google_employees)).to match_array(['first_name_dot_last_initial','first_initial_dot_last_name'])
      end

      it 'should extract the rules for apple_employees' do
        expect(subject.get(apple_employees)).to match_array(['first_initial_dot_last_initial'])
      end
    end
  end
end
