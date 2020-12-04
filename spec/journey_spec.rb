require 'journey'

describe Journey do
  let(:card) {double}
  let(:station) { double}


  let(:card) { double }
  let(:subject) { Journey.new}
  let(:station) { double }

  describe '#in_journey?' do
    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end

    it "should return true when in journey" do
      subject.start(station)
      expect(subject.in_journey?).to eq(true)
    end
  end

end
