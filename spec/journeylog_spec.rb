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

  describe '#start' do
    it 'should start a new journey with an entry station' do
      station = double(:station)
      expect(subject).to respond_to(:start)
    end
  end

  it 'returns all previous trips' do
    subject.start("start_station")
    subject.finish("exit_station")
    expect(subject.trips).to include(["start_station","exit_station"])
  end
end
