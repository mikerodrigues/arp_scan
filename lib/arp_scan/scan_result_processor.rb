require_relative './host'
require_relative './scan_report'

module ARPScan
  # This module is an interface for creating ScanReport objects from arp-scan
  # output.
  #
  module ScanResultProcessor

    # Regex to capture IP address, MAC address, and OUI information
    #
    Host_Entry_Regex = /^(\d+.\d+.\d+.\d+)\t(\w\w:\w\w:\w\w:\w\w:\w\w:\w\w)\t([^\t\n$]*)(?:\tPadding=)?(.*)?$/
   
    # Regex to capture interface and datalink
    #
    Interface_Summary_Regex = /Interface: (?<interface>.+), datalink type: (?<datalink>.*$)/

    # Regex to capture arp-scan version, scan range size, scan time, scan rate,
    # and the number of responding hosts.
    #
    Scan_Summary_Regex = /Ending arp-scan (?<version>.*): (?<range_size>.*) hosts scanned in (?<scan_time>.*) seconds \((?<scan_rate>.*) hosts\/sec\). (?<reply_count>.*) responded/

    # Regex to capture the Hosts List that is outputted if triple-verbosity is
    # enabled.
    #
    Host_List_Entry_Regex = /^(?<entry>\d+)\s+(?<ip>\d+.\d+.\d+.\d+)$/

    # This method does the actual processing of the arp-scan result string. It
    # uses the Regexes to capture data then passes the results to ScanRepor.new
    # to return a ScanReport object.
    #
    def self.process(stdout, stderr, arguments)
      results = {}
      results[:hosts] = stdout.scan(Host_Entry_Regex).map {|entry| Host.new(*entry)}
      results[:interface],
      results[:datalink] = stdout.scan(Interface_Summary_Regex)[0]
      results[:version],
      results[:range_size],
      results[:scan_time],
      results[:scan_rate],
      results[:reply_count] = stdout.scan(Scan_Summary_Regex)[0]
      results[:arguments] = arguments
      results[:host_list] = stdout.scan(Host_List_Entry_Regex).map {|target| Target.new(*target)}
      ScanReport.new(results)
    end
  end
end
