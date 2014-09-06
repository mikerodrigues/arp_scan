module ARPScan
  class ScanReport

    attr_reader :hosts, :interface, :datalink, :version, :range_size, :scan_time, :scan_rate, :reply_count

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

    def to_array
      self.instance_variables.map {|var| self.instance_variable_get var}
    end

    def to_hash
      { :hosts => @hosts.map {|host| host.to_hash},
        :interface => @interface,
        :datalink => @datalink,
        :version => @version,
        :range_size => @range_size,
        :scan_time => @scan_time,
        :scan_rate => @scan_rate,
        :reply_count => @reply_count
      }
    end

  end
end
