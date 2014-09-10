require '../lib/arp_scan'
require_relative './spec_helper'

RSpec.describe ARPScan::ScanReport do

  report_hash = {
    :hosts => [ARPScan::Host.new(*['10.0.0.1', '00:11:22:33:44:55', 'NIC Manufacturer'])],
    :interface => "eth0",
    :datalink => "EN10MB (Ethernet)",
    :version => "1.8.1",
    :range_size => 256,
    :scan_time => 1.503,
    :scan_rate => 170.33,
    :reply_count => 1
  }

  scan_report = ARPScan::ScanReport.new(report_hash)

  it "has a list of zero or more responding hosts" do
    expect(scan_report.hosts.first.class).to eq(ARPScan::Host)
  end

  it "reports the network interface used to scan" do
    expect(scan_report.interface).to eq("eth0")
  end

  it "reports the datalink type of the network interface used to scan" do
    expect(scan_report.datalink).to eq('EN10MB (Ethernet)')
  end

  it "reports the version of `arp-scan` used for the scan" do
    expect(scan_report.version).to eq('1.8.1')
  end

  it "reports the size of the range of scanned IPs" do
    expect(scan_report.range_size).to eq(256)
  end

  it "reports the duration of the scan in seconds" do
    expect(scan_report.scan_time).to eq(1.503)
  end

  it "reports the scan rate in hosts per second" do
    expect(scan_report.scan_rate).to eq(170.33)
  end

  it "reports the number of hosts that responded" do
    expect(scan_report.reply_count).to eq(1)
  end


end
