require_relative "./arp_scan/version"
require_relative "./arp_scan/arp_scanner"
require_relative "./arp_scan/scan_report"
require_relative "./arp_scan/scan_result_processor"
require_relative "./arp_scan/host"

module ARPScan

end

def ARPScan(argument_string = nil)
  ARPScan::ARPScanner.scan argument_string
end
