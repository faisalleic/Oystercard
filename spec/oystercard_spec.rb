require 'oystercard'

describe Oystercard do

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
    #subject.balance = 10
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end

  it "responds to method call, and modifies balance as expected" do
    expect(subject).to respond_to(:top_up).with(1).argument
    expect{subject.top_up 1}.to change{subject.balance}.by 1
  end

  it 'has a maximum limit of £90' do
    subject.top_up(90)
    expect{subject.top_up(91)}.to raise_error "Max Balance reached. Your balance is: 90"
end

  it 'deducts fare from the card' do
     # expect(subject).to respond_to(:deduct).with(1).argument
     # expect{subject.deduct 1}.to change{subject.balance}.by -1
end

  it 'checks minimum balance, raise error if < £1' do
      expect{subject.touch_in}.to raise_error "You do not have enough balance. Minimum needed: £1"
  end


  it 'touch_in changes card in use state to be true' do
    subject.top_up(10)
    subject.touch_in
    expect( subject.in_journey?).to eq true
  end

  it 'touch_out changes card in use state to be false' do
    subject.top_up(10)
    subject.touch_in
    #subject.touch_out
    #expect( subject.in_journey?).to eq false
    expect{subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)

  end

end
