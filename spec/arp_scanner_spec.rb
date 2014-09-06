require '../lib/arp_scan'

RSpec.describe ARPScan::ARPScanner do

  it "has a #scan method to pass arp-scan arguments to as a string" do
    expect(ARPScan::ARPScanner.scan('-l').class).to eq(ARPScan::ScanReport)
  end
  
end

