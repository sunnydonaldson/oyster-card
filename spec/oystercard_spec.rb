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
end