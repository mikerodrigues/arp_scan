require '../lib/arp_scan'

RSpec.describe ARPScan::Host do

  host = ARPScan::Host.new('10.0.0.1', '00:11:22:33:44:55', "NIC Manufacturer")

  it "contains the host's IP address" do
    expect(host.ip_addr).to eq('10.0.0.1')
  end

  it "contains the host's MAC address" do
    expect(host.mac).to eq('00:11:22:33:44:55')
  end

  it "contians the host's OUI information" do
    expect(host.oui).to eq('NIC Manufacturer')
  end

end
