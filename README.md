# ARPScan

[![Gem Version](https://badge.fury.io/rb/arp_scan.svg)](http://badge.fury.io/rb/arp_scan)
<a href="https://codeclimate.com/github/mikerodrigues/arp_scan"><img src="https://codeclimate.com/github/mikerodrigues/arp_scan/badges/gpa.svg" /></a>

Very simple wrapper for using and parsing output from `arp-scan`.

You will need to make sure `arp-scan` is installed. See the arp-scan homepage at http://www.nta-monitor.com/tools/arp-scan/

`arp-scan` generally requires root privs to run. I use `setcap` to give it the
raw socket privs it needs so normal users can run it without sudo:

	`sudo setcap cap_net_raw+ep /usr/bin/arp-scan`

## Notes

There are some tests now, but output containing host names instead of IP
addresses will not be properly parsed. This might be fixed soon.

## Installation

Add this line to your application's Gemfile:

From GitHub:
```ruby
gem 'arp_scan', :git => 'git://github.com/mikerodrigues/arp_scan.git'
```

From RubyGems:
```ruby
gem 'arp_scan'
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

```ruby
require 'arp_scan'

report = ARPScan('--localnet')

report.datalink 	=> "EN10MB (Ethernet)"
report.interface 	=> "eth0"
report.range_size 	=> 256
report.reply_count 	=> 2
report.scan_rate 	=> 169.99 # hosts/sec
report.scan_time 	=> 1.586 # seconds
report.version 		=> "1.8.1" # arp-scan version
report.arguments	=> "--localnet"
```

Each `ScanReport` also holds zero or more `Host` objects representing founds
hosts:

```ruby
first_host = report.hosts.first
first_host.ip_addr 	=> '10.0.0.1'
first_host.mac 	=> '00:11:22:33:44:55'
first_host.oui 	=> "NIC Manufacturer"
```

## Run the Tests
```ruby
cd arp_scan/spec
rspec .
```





## Contributing

1. Fork it ( https://github.com/mikerodrigues/arp_scan/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
