module ARPScan
  class ScanReport

    attr_reader :hosts
    attr_reader :interface, :datalink, :version, :range_size, :scan_time, :scan_rate, :reply_count

    def initialize(hash)
      @hosts = hash[:hosts]
      @interface = hash[:interface]
      @datalink = hash[:datalink]
      @version = hash[:version]
      @range_size = Integer(hash[:range_size])
      @scan_time = Float(hash[:scan_time])
      @scan_rate = Float(hash[:scan_rate])
      @reply_count = Integer(hash[:reply_count])
    end
  end
end
