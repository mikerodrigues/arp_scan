# frozen_string_literal: true

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

    # Create a new hsot. IP address, MAC address and OUI information are
    # expected.
    #
    def initialize(ip_addr, mac, oui)
      @ip_addr = ip_addr
      @mac = mac
      @oui = oui
    end

    # Returns a hash representation of the Host object.
    #
    def to_hash
      { ip_addr: @ip_addr,
        mac: @mac,
        oui: @oui }
    end

    # Returns an array representation of the Host object.
    #
    def to_array
      [@ip_addr,
       @mac,
       @oui]
    end
  end
end
