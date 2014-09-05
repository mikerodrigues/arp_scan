require '../lib/arp_scan.rb'

describe ARPScan, '#scan' do
  it 'returns a ScanReport' do
    report = ARPScan.scan('-I eth0.748 128.111.186.1-128.111.186.75')
    report.class.should eq(ARPScan::ScanReport)
  end
end
