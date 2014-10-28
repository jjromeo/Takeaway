describe Takeaway do 
    
    it 'should initialize with a list of dishes with prices' do
        nandos = Takeaway.new
        expect(nandos.dishes.quarter_chicken).to eq 2.5
        expect(nandos.dishes.half_chicken).to eq 5
        expect(nandos.dishes.whole_chicken).to eq 10
        expect(nandos.dishes.chicken_platter).to eq 15
        
    end

end
