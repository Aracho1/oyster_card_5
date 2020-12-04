require 'journeylog'

describe JourneyLog do
  let(:card) {double}
  let(:station) { double :station }
  let(:journey) { double :journey, new: card }

  it 'responds to new' do
    expect(subject).to be_instance_of(JourneyLog)
  end

  it 'should take an argument' do
    expect(described_class).to respond_to(:new).with(1).argument
  end


  describe '#trips' do
    it "is empty by default" do
      expect(subject.trips).to be_empty
    end
  end

  describe '#in_journey?' do
    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
  end

  describe '#add_entry_station' do
    it 'should start a new journey with an entry station' do
      station = double(:station)
      expect(subject).to respond_to(:add_entry_station)
    end
  end

  it 'returns all previous trips' do
    subject.add_entry_station(station)
    subject.add_exit_station(station)
    expect(subject.trips).to include(1 => [station,station])
  end
end
