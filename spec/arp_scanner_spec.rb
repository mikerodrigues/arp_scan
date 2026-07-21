# frozen_string_literal: true

require_relative './spec_helper'

module ARPScan
  describe ARPScanner do
    describe '#scan' do
      it 'accepts arp-scan arguments as a string' do
        scan_output = File.read(File.expand_path('test_output.txt', __dir__))

        allow(ARPScanner).to receive(:which).with('arp-scan').and_return('/usr/sbin/arp-scan')
        allow(ARPScanner).to receive(:`).with('/usr/sbin/arp-scan -l').and_return(scan_output)

        expect(ARPScanner.scan('-l')).to be_a(ScanReport)
      end
    end
  end
end
