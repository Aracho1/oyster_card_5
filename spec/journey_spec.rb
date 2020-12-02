require 'journey'

describe Journey do

  let(:card) { double }
  let(:subject) { Journey.new(card)}
  let(:station) { double }

  it 'deducts penalty fare from the card if i fail to touch in' do
    allow(card).to receive(:deduct)
    expect(card).to receive(:deduct)
    subject.penalty_fare
  end

  describe '#in_journey?' do
    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
  end

  describe '#trips' do
    it "is empty by default" do
      expect(subject.trips).to be_empty
    end

    it 'returns all previous trips' do
      subject.add_entry_station(station)
      subject.add_exit_station(station)
      expect(subject.trips).to include(1 => [station,station])
    end
  end
end
