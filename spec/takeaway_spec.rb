describe Takeaway do

  let(:nandos) {Takeaway.new}

  it 'should initialize with a list of dishes with prices' do
    expect(nandos.dishes.quarter_chicken).to eq 2.5
    expect(nandos.dishes.half_chicken).to eq 5
    expect(nandos.dishes.whole_chicken).to eq 10
    expect(nandos.dishes.chicken_platter).to eq 15
  end

  it 'should allow someone to order a dish by giving list, quantity and total and that to send a Twilio message' do
    VCR.use_cassette('twilio') do
      expect{ nandos.make_order({ quarter_chicken: 2,
                                 half_chicken: 2 }, 15) }.not_to raise_error
      expect(nandos.make_order({ quarter_chicken: 2, half_chicken: 2 }, 15)).to be_an_instance_of Twilio::REST::Message
    end
  end

  it 'should not let someone order a dish if they get the sum incorrect' do
    expect{ nandos.make_order({ quarter_chicken: 2,
                               half_chicken: 2 }, 25) }.to raise_error "The total amount is wrong! please try again"
  end

  it 'should activate twilio\'s message sending when a successful order is made'   do
  end
end
