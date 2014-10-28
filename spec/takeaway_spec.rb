describe Takeaway do 
    
    it 'should initialize with a list of dishes with prices' do
        nandos = Takeaway.new
        expect(nandos.dishes.quarter_chicken).to eq 2.5
        expect(nandos.dishes.half_chicken).to eq 5
        expect(nandos.dishes.whole_chicken).to eq 10
        expect(nandos.dishes.chicken_platter).to eq 15
    end

    it 'should allow someone to order a dish by giving list, quantity and total' do
        nandos = Takeaway.new
        expect{ nandos.make_order({quarter_chicken: 2, 
                                          half_chicken: 2}, 15)}.not_to raise_error
        expect(nandos.make_order({quarter_chicken: 2, 
                                          half_chicken: 2}, 15)).to eq "order correct and being processed"
    end
end
