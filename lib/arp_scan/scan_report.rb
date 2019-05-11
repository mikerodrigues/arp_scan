module ARPScan

  # This class abstracts the string output from arp-scan into an Object. A
  # ScanReports are usually created through the ScanResultProcessor module.
  #
  class ScanReport

    # Array of Host objects.
    #
    attr_reader :hosts

    # Name of the interface used for the scan.
    #
    attr_reader :interface

    # Information about the interface type.
    #
    attr_reader :datalink

    # `arp-scan` version number.
    #
    attr_reader :version

    # Size of the scan range ( # of hosts scanned ).
    #
    attr_reader :range_size

    # Duration of the scan in seconds, returns a Float.
    #
    attr_reader :scan_time

    # The rate of the scan in hosts per second, returns a Float.
    #
    attr_reader :scan_rate

    # The number of hosts that replied to the scan, returns a Fixnum
    attr_reader :reply_count

    # The argument string passed to ARPScan
    attr_reader :arguments

    # The list of target hosts to be scanned
    attr_reader :host_list

    # Create a new scan report, passing in every attribute. The best way to do
    # this is with the ScanResultProcessor module.
    #
    def initialize(hash)
      @hosts = hash[:hosts]
      @interface = hash[:interface]
      @datalink = hash[:datalink]
      @version = hash[:version]
      @range_size = Integer(hash[:range_size])
      @scan_time = Float(hash[:scan_time])
      @scan_rate = Float(hash[:scan_rate])
      @reply_count = Integer(hash[:reply_count])
      @arguments = hash[:arguments]
      @host_list = hash[:host_list]
    end

    # Returns a hash representation of the ScanReport. Metadata about the scan,
    # and array of Host hashes comprise the hash.
    #
    def to_hash
      { :hosts => @hosts.map {|host| host.to_hash},
        :interface => @interface,
        :datalink => @datalink,
        :version => @version,
        :range_size => @range_size,
        :scan_time => @scan_time,
        :scan_rate => @scan_rate,
        :reply_count => @reply_count,
        :arguments => @arguments,
        :host_list => @host_list.map {|host| host.to_hash}
      }
    end

  end
end
