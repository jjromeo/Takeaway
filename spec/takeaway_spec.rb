describe Takeaway do 
    
    it 'should initialize with a list of dishes with prices' do
        nandos = Takeaway.new
        expect(nandos.dishes.half_chicken).to eq 5
    end

end
