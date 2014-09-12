require_relative './spec_helper'

module ARPScan
  describe Host do

    host = Host.new('10.0.0.1', '00:11:22:33:44:55', "NIC Manufacturer")

    describe "#ip_addr" do
      it "returns the host's IP address" do
        expect(host.ip_addr).to eq('10.0.0.1')
      end
    end

    describe "#mac" do
      it "returns the host's MAC address" do
        expect(host.mac).to eq('00:11:22:33:44:55')
      end
    end

    describe "#oui" do
      it "returns the host's OUI information" do
        expect(host.oui).to eq('NIC Manufacturer')
      end
    end

  end
end
