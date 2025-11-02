# frozen_string_literal: true

require_relative './spec_helper'

module ARPScan
  describe ScanResultProcessor do
    argument_string = '-l'
    report_string = File.read './test_output.txt'
    report_string_2 = File.read './test_output_2.txt'
    report = ARPScan::ScanResultProcessor.process(report_string, argument_string)
    report_2 = ARPScan::ScanResultProcessor.process(report_string_2, argument_string)

    describe '#process' do
      it 'processes arp-scan output to create a ScanReport object' do
        expect(report.class).to eq(ARPScan::ScanReport)
        expect(report_2.class).to eq(ARPScan::ScanReport)
      end

      it 'builds an array of Host objects' do
        expect(report.hosts[0].class).to eq(ARPScan::Host)
        expect(report_2.hosts[0].class).to eq(ARPScan::Host)
      end

      it 'parses the scan interface name' do
        expect(report.interface).to eq('eth0')
        expect(report_2.interface).to eq('enp4s0')
      end

      it 'parses the datalink type information' do
        expect(report.datalink).to eq('EN10MB (Ethernet)')
        expect(report_2.datalink).to eq('EN10MB')
      end

      it 'parses the ip of the scanner on newer versions of arp-scan' do
        expect(report_2.ipv4).to eq('10.0.0.5')
      end

      it 'parses the MAC of the scanner on newer versions of arp-scan' do
        expect(report_2.mac).to eq('a1:b2:c3:d4:e5:f6')
      end

      it 'parses the version of arp-scan that ran the scan' do
        expect(report.version).to eq('1.8.1')
      end

      it 'parses the number of hosts scanned' do
        expect(report.range_size).to eq(256)
      end

      it 'parses the duration of the scan in seconds' do
        expect(report.scan_time).to eq(1.494)
      end

      it 'parses the rate of the scan in hosts per second' do
        expect(report.scan_rate).to eq(171.35)
      end

      it 'parses the number of hosts that responded to the scan' do
        expect(report.reply_count).to eq(1)
      end

      it 'includes the argument string in the report' do
        expect(report.arguments).to eq('-l')
      end
    end
  end
end
