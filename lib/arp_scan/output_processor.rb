require_relative './host'
require_relative './scan_report'

module ARPScan
  module OutputProcessor

    Host_Entry_Regex = /(\d+.\d+.\d+.\d+)\s(\w\w:\w\w:\w\w:\w\w:\w\w:\w\w)\s(.*)/
    Interface_Summary_Regex = /Interface: (?<interface>.+), datalink type: (?<datalink>.*$)/
    Received_Summary_Regex = /Ending arp-scan (?<version>.*): (?<range_size>.*) hosts scanned in (?<scan_time>.*) seconds \((?<scan_rate>.*) hosts\/sec\). (?<reply_count>.*) responded/

    def self.process(string)
      report = {}
      report[:hosts] = string.scan(Host_Entry_Regex)
      report[:interface],
      report[:datalink] = string.scan(Interface_Summary_Regex)
      report[:range_size],
      report[:scan_time],
      report[:scan_rate],
      report[:reply_count] = string.scan(Received_Summary_Regex)
      hosts = report[:hosts].map {|entry| Host.new(*entry)}
      ScanReport.new(report)
    end
  end
end
