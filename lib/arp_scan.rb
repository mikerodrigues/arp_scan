require_relative "./arp_scan/version"
require_relative "./arp_scan/arp_scanner"
require_relative "./arp_scan/scan_report"
require_relative "./arp_scan/scan_result_processor"
require_relative "./arp_scan/host"

# This module just acts as a namespace for the gem.
#
module ARPScan; end

# The main interface for the gem. This method accepts arp-scan arguments in the
# form of a single string. Currently only IP addresses (no hostnames) are
# supported.
#
def ARPScan(argument_string = nil)
  ARPScan::ARPScanner.scan argument_string
end
