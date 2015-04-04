require_relative './spec_helper'

module ARPScan
  describe Host do

    host = Host.new('10.0.0.1', '00:11:22:33:44:55', "NIC Manufacturer", "")
    host2 = Host.new('10.0.0.2', '00:11:22:33:44:66', "NIC Manufacturer", "000000000000000000000000000000000000")

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

    describe "#padding" do
      it "returns padding data if available" do
        expect(host2.padding).to eq('000000000000000000000000000000000000')
      end

      it "returns empty string if no padding data is found" do
        expect(host.padding).to eq('')
      end
    end

    describe "#to_array" do
      it "returns an array of host data" do
        expect(host.to_array).to eq(["10.0.0.1", "00:11:22:33:44:55", "NIC Manufacturer", ""])
        expect(host.to_array).to eq(["10.0.0.1", "00:11:22:33:44:55", "NIC Manufacturer", ""])
      end

      it "returns an array with 4 elements" do
        expect(host.to_array.count).to eq(4)
      end
    end

  end
end
