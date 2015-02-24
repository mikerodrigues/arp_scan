require_relative './spec_helper'

module ARPScan
  describe ScanReport do

    report_hash = {
      :hosts => [Host.new(*['10.0.0.1', '00:11:22:33:44:55', 'NIC Manufacturer'])],
      :interface => "eth0",
      :datalink => "EN10MB (Ethernet)",
      :version => "1.8.1",
      :range_size => 10,
      :scan_time => 1.503,
      :scan_rate => 6.65,
      :reply_count => 1,
      :arguments => '--verbose --verbose --verbose 10.0.0.0-10.0.0.10',
      :host_list => [
        Target.new(*["1", "10.0.0.0"]),
        Target.new(*["2", "10.0.0.1"]),
        Target.new(*["3", "10.0.0.2"]),
        Target.new(*["4", "10.0.0.3"]),
        Target.new(*["5", "10.0.0.4"]),
        Target.new(*["6", "10.0.0.5"]),
        Target.new(*["7", "10.0.0.6"]),
        Target.new(*["8", "10.0.0.7"]),
        Target.new(*["9", "10.0.0.8"]),
        Target.new(*["10", "10.0.0.9"])
      ]
    }

    scan_report = ScanReport.new(report_hash)

    describe "#hosts" do
      it "returns an Array of Host objects" do
        expect(scan_report.hosts.class).to eq(Array)
        expect(scan_report.hosts.first.class).to eq(Host)
      end
    end

    describe "#interface" do
      it "returns the network interface used to scan" do
        expect(scan_report.interface).to eq("eth0")
      end
    end

    describe "#datalink" do
      it "returns the datalink type of the network interface used to scan" do
        expect(scan_report.datalink).to eq('EN10MB (Ethernet)')
      end
    end

    describe "#version" do
      it "returns the version of `arp-scan` used for the scan" do
        expect(scan_report.version).to eq('1.8.1')
      end
    end

    describe "#range_size" do
      it "returns the size of the range of scanned IPs" do
        expect(scan_report.range_size).to eq(10)
      end
    end

    describe "#scan_time" do
      it "returns the duration of the scan in seconds" do
        expect(scan_report.scan_time).to eq(1.503)
      end
    end

    describe "#scan_rate" do
      it "returns the scan rate in hosts per second" do
        expect(scan_report.scan_rate).to eq(6.65)
      end
    end

    describe "#reply_count" do
      it "returns the number of hosts that responded" do
        expect(scan_report.reply_count).to eq(1)
      end
    end

    describe "#arguments" do
      it "returns the argument string used to scan" do
        expect(scan_report.arguments).to eq('--verbose --verbose --verbose 10.0.0.0-10.0.0.10')
      end
    end

    describe "#host_list" do
      it "returns a list of Target objects representing hosts to scan" do
        expect(scan_report.host_list.first.class).to eq(Target)
      end

      it "its count should match #range_size" do
        expect(scan_report.host_list.count).to eq(scan_report.range_size)
      end
    end

  end
end
