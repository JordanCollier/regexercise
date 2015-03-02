require 'regexercise'

RSpec.describe RegExercise do

  before(:each) do
    @lines = [
      'Bobby',
      'here',
      'there',
      'Banana bobby',
      'bad banana',
      ' 10 ',
      '',
      '',
      '&#(*$&}@*#&(*%',
      'carl@example.com',
      'jason@somewhere.net',
      'john.smith@jsmith.org',
      'john@smith@jsmith.org',
      'sarah.jones@www.jones.org',
      'kevin spacey@place.com',
      'bObby',
      'bOBBY',
      'B0bBy',
    ]
    @obj = RegExercise.new(@lines)
  end

  describe '#all' do
    it 'matches everything' do
      expect(@obj.all).to eq(@lines)
    end
  end

  describe '#starts_with_big_b' do
    it "matches lines that begin with 'B'" do
      expect(@obj.starts_with_big_b).
        to eq(['Bobby', 'Banana bobby', 'B0bBy',])
    end
  end

  describe '#empties' do
    it 'matches empty lines' do
      expect(@obj.empties).to eq(['', ''])
    end
  end

  describe '#here_or_there' do
    it "matches exactly 'here' or 'there'" do
      expect(@obj.here_or_there).to eq(['here', 'there'])
    end
  end

  describe '#any_bobby' do
    it "matches 'bobby' in any case" do
      expect(@obj.any_bobby).
        to eq(['Bobby', 'Banana bobby', 'bObby', 'bOBBY'])
    end
  end

  describe '#email_addresses' do
    it 'matches email addresses' do
      expect(@obj.email_addresses). to eq([
        'carl@example.com', 'jason@somewhere.net', 'john.smith@jsmith.org',
      ])
    end
  end

end
