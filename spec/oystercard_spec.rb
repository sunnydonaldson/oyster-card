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
      expect{ subject.add(101)}.to raise_error 'breaches maximum amount'
    end
  end
end