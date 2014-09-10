require '../lib/arp_scan'
require_relative './spec_helper.rb'

RSpec.describe ARPScan do
  report = ARPScan('-l')

  it "is a method you can pass arp-scan arguments to as a string" do
    expect(ARPScan('-l').class).to eq(ARPScan::ScanReport)
  end

  it "returns a nested hash of attributes" do
    expect(report.to_hash.class).to eq(Hash)
  end

  it "returns a nested array of attributes" do
    expect(report.to_array.class).to eq(Array)
  end
end
