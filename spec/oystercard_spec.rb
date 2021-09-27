require 'Oystercard'

describe Oystercard do
  describe "#initialize" do
    it 'has money instance variable' do
      expect(subject.instance_variable_get(:@balance)).to eq 0
    end
  end

  describe '#add' do
    it 'add money to card' do
      subject.add(100)
      expect(subject.instance_variable_get(:@balance)).to eq 100
    end
  end
end