module ARPScan
  class Host
    attr_reader :ip_addr, :mac, :oui

    def initialize(ip_addr, mac, oui)
      @ip_addr = ip_addr
      @mac = mac
      @oui = oui
    end

    def to_hash
      { :ip_addr => @ip_addr,
        :mac     => @mac,
        :oui      => @oui
      }
    end

    def to_array
      [ @ip_addr,
        @mac,
        @oui
      ]
    end
  end
end
