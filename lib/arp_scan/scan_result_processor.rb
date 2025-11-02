# frozen_string_literal: true

require_relative './host'
require_relative './scan_report'

module ARPScan
  # This module is an interface for creating ScanReport objects from arp-scan
  # output.
  #
  module ScanResultProcessor
    # Regex to capture IP address, MAC address, and OUI information
    #
    HOST_ENTRY_REGEX = /(\d+.\d+.\d+.\d+)\s(\w\w:\w\w:\w\w:\w\w:\w\w:\w\w)\s(.*)/

    # Regex to capture interface and datalink
    #
    INTERFACE_SUMMARY_REGEX = /
    ^Interface:\s+(?<interface>[^,\n]+),
    (?:\s*datalink)?\s*type:\s*(?<datalink>[^\n,]+?)(?=,\s*MAC:|$)
    (?:,\s*MAC:\s*(?<mac>[0-9A-Fa-f]{2}(?::[0-9A-Fa-f]{2}){5}))?
      (?:,\s*IPv4:\s*(?<ipv4>(?:(?:25[0-5]|2[0-4]\d|1?\d?\d)\.){3}(?:25[0-5]|2[0-4]\d|1?\d?\d)))?
      $
    /x



    # Regex to capture arp-scan version, scan range size, scan time, scan rate,
    # and the number of responding hosts.
    #
    SCAN_SUMMARY_REGEX = %r{Ending arp-scan (?<version>.*): (?<range_size>.*) hosts scanned in (?<scan_time>.*) seconds \((?<scan_rate>.*) hosts/sec\). (?<reply_count>.*) responded}

    # This method does the actual processing of the arp-scan result string. It
    # uses the Regexes to capture data then passes the results to ScanRepor.new
    # to return a ScanReport object.
    #
    def self.process(string, arguments)
      results = {}
      results[:hosts] = string.scan(HOST_ENTRY_REGEX).map { |entry| Host.new(*entry) }
      results[:interface],
        results[:datalink],
        results[:ipv4],
        results[:mac] = string.scan(INTERFACE_SUMMARY_REGEX)[0]
      results[:version],
        results[:range_size],
        results[:scan_time],
        results[:scan_rate],
        results[:reply_count] = string.scan(SCAN_SUMMARY_REGEX)[0]
      results[:arguments] = arguments
      ScanReport.new(results)
    end
  end
end
