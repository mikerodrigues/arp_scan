require 'open3'
require_relative './scan_result_processor'

module ARPScan
  # This module manages finding the arp-scan binary and running the scan. It
  # delegates the parsing of the scan results to the ScanResultProcessor module.
  #
  module ARPScanner
    # I got this method from: http://stackoverflow.com/questions/2108727
    # Cross-platform way of finding an executable in the $PATH.
    #
    #   which('ruby') #=> /usr/bin/ruby
    #
    def self.which(cmd)
      exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
      ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
          exe = File.join(path, "#{cmd}#{ext}")
          return exe if File.executable?(exe) && !File.directory?(exe)
        }
      end
      raise 'arp-scan binary not found, make sure it is installed'
    end

    # This method runs the actual scan by passing the arguments to the arp-scan
    # binary. The results are passed to the ScanResultProcessor and a ScanReport
    # is returned.
    #
    def self.scan(argument_string = nil)
      command = "#{which 'arp-scan'} #{argument_string}"
      stdout, stderr, status = Open3.capture3(command)
      unless status.to_i == 0
        raise stderr
      end
      ScanResultProcessor.process(stdout, stderr, argument_string)
    end

    private_class_method :which
  end
end

