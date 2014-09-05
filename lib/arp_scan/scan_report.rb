module ARPScan
  class ScanReport

    attr_reader :interface, :datalink, :version, :range_size, :scan_time, :scan_rate, :reply_count

    def initialize(hosts: nil, interface: nil, datalink: nil, version: nil, range_size: nil, scan_time: nil, scan_rate: nil, reply_count: nil)
      @hosts = hosts
      @interface = interface
      @datalink = datalink
      @version = version
      @range_size = range_size
      @scan_time = scan_time
      @scan_rate = scan_rate
      @reply_count = reply_count
    end
  end
end
