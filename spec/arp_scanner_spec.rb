require_relative './spec_helper'

module ARPScan
  describe ARPScanner do
    describe "#scan" do
      it "accepts arp-scan arguments as a string" do
    #    expect(ARPScanner.scan('-l').class).to eq(ScanReport)
      end

      it "raises an error if passed invalid scan arguments" do
    #    expect { ARPScanner.scan('invalid arguments')}.to raise_error
      end
    end

    describe "#which" do
      it "returns a path for the binary if found" do
        expect(ARPScanner.send(:which, 'ping').class).to eq(String)
      end

      it "raises an error if no matching binary is found" do
        expect { ARPScanner.send(:which, 'ireallyhopeyoudonthavethisbin') }.to raise_error
      end
    end

  end
end
end
