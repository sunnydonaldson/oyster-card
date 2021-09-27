require 'Oystercard'

describe Oystercard do
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

  describe "#charge" do
    it "deducts fare from card" do
      subject.add(20)
      subject.charge(10)
      expect(subject.instance_variable_get(:@balance)).to eq 10
    end

    it "makes sure you have the minimum amount for a journey" do
      subject.add(20)
      expect{ subject.charge(30)}.to raise_error 'breaches minimum amount'
    end
  end

  describe "#touch_in" do
    it "signs user in" do
      subject.touch_in
      expect(subject.instance_variable_get(:@in_use)).to eq(true)
    end

    it "throws error if is signed in" do
      subject.touch_in
      expect{subject.touch_in}.to raise_error 'already in journey'
    end
  end

  describe "#touch_out" do
    it "signs user out" do
      subject.touch_in
      subject.touch_out

      expect(subject.instance_variable_get(:@in_use)).to eq(false)
    end
    
    it "throws error if user isn't signed in" do
      expect{subject.touch_out}.to raise_error "not in journey"
    end
  end
  

end