# ARPScan

Very simple wrapper for using and parsing output from `arp-scan`.

You will need to make sure `arp-scan` is installed. See the arp-scan homepage at http://www.nta-monitor.com/tools/arp-scan/

You'll also need superuser privileges to run `arp-scan`, you have have a few
options but be sure to understand what you're doing before you do it:

* Edit `/etc/sudoers` to allow user to run `arp-scan` as root without a
  password.

    usr host = (root) NOPASSWD: //usr/bin/arp-scan

* Set the SUID bit on the `arp-scan` bin:

    sudo chmod u+s /usr/bin/arp-scan

* Run your Ruby code as root (I wouldn't do this)

I use the SUID method but if you have other people logging into your machine you
should probably go with the `/etc/sudoers` method.


## Notes

This code is untested and will hopefully be refactored soon.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arp_scan', :git => 'git://github.com/mikerodrigues/arp_scan.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arp_scan

## Usage

No argument parsing is done by the gem, it takes the same arguments as
`arp-scan` and just passes them to the binary. The result is returned as a
ScanReport object which makes it easy to iterate through hosts as well as see
metainfo about the scan itself.

Scanning is easy:

    require 'arp_scan'

    report = ARPScan('--localnet')

    report.datalink 	=> "EN10MB (Ethernet)",
    report.interface 	=> "eth0"
    report.range_size 	=> "256"
    report.reply_count 	=> "2"
    report.scan_rate 	=> "169.99" # hosts/sec
    report.scan_time 	=> "1.586" # seconds
    report.version 	=> "1.8.1" # arp-scan version

Each `ScanReport` also holds zero or more `Host` objects representing founds
hosts:

    first_host = report.hosts.first
    first_host.ip_addr 	=> '10.0.0.1'
    first_host.mac 	=> '00:11:22:33:44:55'
    first_host.oui 	=> "NIC Manufacturer"






## Contributing

1. Fork it ( https://github.com/mikerodrigues/arp_scan/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
