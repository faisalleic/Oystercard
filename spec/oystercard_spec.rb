require 'oystercard'

describe Oystercard do

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  # describe '#top_up' do
  #   it { should respond_to(:top_up).with(1).argument }
  #   expect{subject.top_up 1}.to change{subject.balance}.by 1
  # end

    it "responds to method call, and modifies balance as expected" do
      expect(subject).to respond_to(:top_up).with(1).argument
      expect{subject.top_up 1}.to change{subject.balance}.by 1
    end
  end
