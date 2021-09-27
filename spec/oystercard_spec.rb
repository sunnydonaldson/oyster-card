require 'Oystercard'

describe Oystercard do
  let(:location) {double :location}
  describe "#initialize" do

    it 'has money instance variable' do
      expect(subject.instance_variable_get(:@balance)).to eq 0
    end
  end

  describe '#add' do
    it 'add money to card' do
      subject.add(50)
      expect(subject.instance_variable_get(:@balance)).to eq 50
    end

    it 'has limit of 100£' do
      expect{ subject.add(Oystercard::MAXIMUMLIMIT + 1)}.to raise_error 'breaches maximum amount'
    end
  end


  describe "#touch_in" do
    it "signs user in" do
      subject.add(50)
      subject.touch_in(location)
      expect(subject.instance_variable_get(:@in_use)).to eq(true)
    end

    it "throws error if is signed in" do
      subject.add(50)
      subject.touch_in(location)
      expect{subject.touch_in(location)}.to raise_error 'already in journey'
    end

    it "keeps track of the location touched into" do
      subject.add(50)
      subject.touch_in(location)
      expect(subject.instance_variable_get(:@last_touch_in)).to eq location
    end
  end

  describe "#touch_out" do
    
    it "signs user out" do
      subject.add(50)
      subject.touch_in(location)
      subject.touch_out

      expect(subject.instance_variable_get(:@in_use)).to eq(false)
    end
    
    it "throws error if user isn't signed in" do
      subject.add(50)
      expect{subject.touch_out}.to raise_error "not in journey"
    end

    it "deducts 1£ when touch out" do
      subject.add(50)
      subject.touch_in(location)
      subject.touch_out
      expect(subject.instance_variable_get(:@balance)).to eq(49)
    end

    it "checks locacation is set to nil" do
      subject.add(50)
      subject.touch_in(location)
      subject.touch_out
      expect(subject.instance_variable_get(:@last_touch_in)).to eq nil
    end

  end
  

end