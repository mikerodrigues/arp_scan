require '../lib/arp_scan'
require_relative './spec_helper'

module ARPScan
  describe ARPScanner do
    describe "#scan" do
      it "accepts arp-scan arguments as a string" do
        expect(ARPScanner.scan('-l').class).to eq(ScanReport)
      end
    end
  end
end
