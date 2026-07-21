# frozen_string_literal: true

require_relative './spec_helper'

RSpec.describe 'ARPScan' do
  it 'delegates to ARPScanner.scan' do
    report = instance_double(ARPScan::ScanReport)

    expect(ARPScan::ARPScanner).to receive(:scan).with('-l').and_return(report)

    expect(ARPScan('-l')).to eq(report)
  end
end
