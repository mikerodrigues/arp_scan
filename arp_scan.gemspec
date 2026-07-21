# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arp_scan/version'

Gem::Specification.new do |spec|
  spec.name          = 'arp_scan'
  spec.version       = ARPScan::VERSION
  spec.authors       = ['Michael Rodrigues']
  spec.email         = ['mikebrodrigues@gmail.com']
  spec.summary       = 'A ruby wrapper for the arp-scan utility.'
  spec.description   = 'Use the arp-scan utility from your ruby programs.'
  spec.homepage      = 'https://github.com/mikerodrigues/arp_scan'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(__dir__) do
    Dir['LICENSE.txt', 'README.md', 'lib/**/*.rb']
  end
  spec.executables   = []
  spec.require_paths = ['lib']
end
