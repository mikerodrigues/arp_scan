require_relative './host'
module ARPScan
  module OutputProcessor

    Host_Entry_Regex = /(\d+.\d+.\d+.\d+)\s(\w\w:\w\w:\w\w:\w\w:\w\w:\w\w)\s(.*)/
    Interface_Summary_Regex = /Interface: (?<interface>.+), datalink type: (?<datalink>.*$)/
    Received_Summary_Regex = /Ending arp-scan (?<version>.*): (?<range_size>.*) hosts scanned in (?<scan_time>.*) seconds \((?<scan_rate>.*) hosts\/sec\). (?<reply_count>.*) responded/

    def self.process(string)
      report = {}
      report[:hosts] = string.scan(Host_Entry_Regex)
      report[:interface_summary] = string.match(Interface_Summary_Regex)
      report[:summary] = string.match(Received_Summary_Regex)
      hosts = report[:hosts].map {|entry| Host.new(*entry)}
      ScanReport.new(
        hosts: hosts,
        interface: report[:interface_summary][:interface],
        datalink: report[:interface_summary][:datalink],
        version: report[:summary][:version],
        range_size: report[:summary][:range_size],
        scan_time: report[:summary][:scan_time],
        scan_rate: report[:summary][:scan_rate],
        reply_count: report[:summary][:reply_count]
      )
    end
  end
end
