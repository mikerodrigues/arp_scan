module ARPScan
  class Target

    # Target entry number in host list
    #
    attr_reader :entry

    # Target IP
    #
    attr_reader :ip_addr

    def initialize(entry, ip_addr)
      @entry = Integer(entry)
      @ip_addr = ip_addr
    end

    # Returns a hash representation of the Target object.
    #
    def to_hash
      { :entry => @entry,
        :ip_addr=> @ip_addr
      }
    end

    # Returns a array representation of the Target object.
    #
    def to_array
      [ @entry,
        @ip_addr
      ]
    end
  end
end
