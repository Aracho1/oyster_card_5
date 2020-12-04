require 'journey'

describe Journey do
  let(:card) {double}
  let(:station) { double}


  let(:card) { double }
  let(:subject) { Journey.new(card)}
  let(:station) { double }

  it 'deducts penalty fare from the card if i fail to touch in' do
    allow(card).to receive(:deduct)
    expect(card).to receive(:deduct)
    subject.penalty_fare
  end


end
