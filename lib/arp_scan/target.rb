module ARPScan
  class Target

    # Target entry number in host list
    #
    attr_accessor :entry

    # Target IP
    #
    attr_accessor :ip

    def initialize(entry, ip)
      @entry = entry
      @ip = ip
    end
  end
end
