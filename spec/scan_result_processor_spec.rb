require '../lib/arp_scan'
require_relative './spec_helper'

RSpec.describe ARPScan::ScanResultProcessor do

  report_string = File.read './test_output.txt'
  report = ARPScan::ScanResultProcessor.process(report_string)
  
  it "processes arp-scan output to create a ScanReport object" do
    expect(report.class).to eq(ARPScan::ScanReport)
  end

  it "builds an array of Host objects" do
    expect(report.hosts[0].class).to eq(ARPScan::Host)
  end

  it "parses the scan interface name" do
    expect(report.interface).to eq("eth0")
  end

  it "parses the datalink type information" do
    expect(report.datalink).to eq("EN10MB (Ethernet)")
  end

  it "parses the version of arp-scan that ran the scan" do
    expect(report.version).to eq('1.8.1')
  end

  it "parses the number of hosts scanned" do
    expect(report.range_size).to eq(256)
  end

  it "parses the duration of the scan in seconds" do
    expect(report.scan_time).to eq(1.494)
  end

  it "parses the rate of the scan in hosts per second" do
    expect(report.scan_rate).to eq(171.35)
  end

  it "parses the number of hosts that responded to the scan" do
    expect(report.reply_count).to eq(1)
  end
end

