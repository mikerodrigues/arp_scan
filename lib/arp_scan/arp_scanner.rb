require_relative './scan_result_processor'

module ARPScan
  module ARPScanner

    # I got this method from: http://stackoverflow.com/questions/2108727
    # Cross-platform way of finding an executable in the $PATH.
    #
    #   which('ruby') #=> /usr/bin/ruby
    def self.which(cmd)
      exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
      ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
          exe = File.join(path, "#{cmd}#{ext}")
          return exe if File.executable?(exe) && !File.directory?(exe)
        }
      end
      return nil
    end

    def self.scan(argument_string = nil)
      result_string = `#{which 'arp-scan'} #{argument_string}`
      ScanResultProcessor.process(result_string)
    end

    private_class_method :which
  end
end

