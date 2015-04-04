require_relative './spec_helper'

module ARPScan
  describe Target do
    
    target_array = ["1", "10.0.0.0"]
    
    target = Target.new(*target_array)
 
    describe "#entry" do
      it "returns the target's entry number in the hosts list" do
        expect(target.entry).to eq(1)
      end
    end
    
    describe "#ip_addr" do
      it "returns the target's IP address" do
        expect(target.ip_addr).to eq('10.0.0.0')
      end
    end

    describe "#to_array" do
      it "returns the target data in an array" do
        expect(target.to_array).to eq([1, '10.0.0.0'])
      end
    end
  
  end
end
