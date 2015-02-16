describe EmailPredictor::DataAnalyser do

  subject {EmailPredictor::DataAnalyser}

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
  describe 'dataset' do

    it 'should have the dataset' do
      expect(subject.dataset).to include(
        {
          'John Ferguson' => 'john.ferguson@alphasights.com',
          'Damon Aw'      => 'damon.aw@alphasights.com',
          'Linda Li'      => 'linda.li@alphasights.com',
          'Larry Page'    => 'larry.p@google.com',
          'Sergey Brin'   => 's.brin@google.com',
          'Steve Jobs'    => 's.j@apple.com'
        }
      )
    end

    it 'should group by company with company as keys' do
      expect(subject.group_by_company.keys).to match_array(['alphasights','google','apple'])
    end

    it 'should group_by_company' do
      expect(subject.group_by_company).to include({'alphasights' => alphasights_employees,
                                                   'google' => google_employees,
                                                   'apple' => apple_employees
                                                   })
    end

    describe 'prediction for existing data, all prediction' do
      it 'should have collection of number of companies' do
        expect(subject.all).to have_exactly(3).items
      end

      it 'should have collection with the company name' do
        expect(subject.all.collect(&:company)).to match_array(['alphasights','google','apple'])
      end
    end

    describe 'find prediction for a particular company' do
      it 'should have prediction for a company' do
        expect(subject.find('alphasights').company).to eq('alphasights')
      end

      it 'should have rules for a particular company ' do
        expect(subject.find('alphasights').rules).to eq(['first_name_dot_last_name'])
      end
    end
  end
end
