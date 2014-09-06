require_relative './host'
require_relative './scan_report'

module ARPScan
  module OutputProcessor

    Host_Entry_Regex = /(\d+.\d+.\d+.\d+)\s(\w\w:\w\w:\w\w:\w\w:\w\w:\w\w)\s(.*)/
    Interface_Summary_Regex = /Interface: (?<interface>.+), datalink type: (?<datalink>.*$)/
    Scan_Summary_Regex = /Ending arp-scan (?<version>.*): (?<range_size>.*) hosts scanned in (?<scan_time>.*) seconds \((?<scan_rate>.*) hosts\/sec\). (?<reply_count>.*) responded/

    def self.process(string)
      report = {}
      report[:hosts] = string.scan(Host_Entry_Regex).map {|entry| Host.new(*entry)}
      report[:interface],
      report[:datalink] = string.scan(Interface_Summary_Regex)[0]
      report[:version],
      report[:range_size],
      report[:scan_time],
      report[:scan_rate],
      report[:reply_count] = string.scan(Scan_Summary_Regex)[0]
      ScanReport.new(report)
    end
  end
end
