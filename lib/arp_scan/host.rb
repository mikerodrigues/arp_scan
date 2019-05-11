module ARPScan
  # Abstracts replying hosts from the arp-scan output.
  #
  class Host

    # The IP address of the host.
    #
    attr_reader :ip_addr

    # The MAC address of the host.
    #
    attr_reader :mac

    # OUI information about the host.
    #
    attr_reader :oui

    # Padding data, if running a double-verbose scan.
    #
    attr_reader :padding

    # Create a new hsot. IP address, MAC address and OUI information are
    # expected.
    #
    def initialize(ip_addr, mac, oui, padding = nil)
      @ip_addr = ip_addr
      @mac = mac
      @oui = oui
      @padding = padding
    end

    # Returns a hash representation of the Host object.
    #
    def to_hash
      { :ip_addr => @ip_addr,
        :mac     => @mac,
        :oui      => @oui,
        :padding  => @padding
      }
    end

    # Returns an array representation of the Host object.
    #
    def to_array
      [ @ip_addr,
        @mac,
        @oui,
        @padding
      ]
    end
  end
end
