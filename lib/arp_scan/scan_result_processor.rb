require_relative './host'
require_relative './scan_report'

module ARPScan
  module ScanResultProcessor

    Host_Entry_Regex = /(\d+.\d+.\d+.\d+)\s(\w\w:\w\w:\w\w:\w\w:\w\w:\w\w)\s(.*)/
    Interface_Summary_Regex = /Interface: (?<interface>.+), datalink type: (?<datalink>.*$)/
    Scan_Summary_Regex = /Ending arp-scan (?<version>.*): (?<range_size>.*) hosts scanned in (?<scan_time>.*) seconds \((?<scan_rate>.*) hosts\/sec\). (?<reply_count>.*) responded/

    def self.process(string)
      results = {}
      results[:hosts] = string.scan(Host_Entry_Regex).map {|entry| Host.new(*entry)}
      results[:interface],
      results[:datalink] = string.scan(Interface_Summary_Regex)[0]
      results[:version],
      results[:range_size],
      results[:scan_time],
      results[:scan_rate],
      results[:reply_count] = string.scan(Scan_Summary_Regex)[0]
      ScanReport.new(results)
    end
  end
end
