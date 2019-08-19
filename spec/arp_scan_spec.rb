# frozen_string_literal: true

require_relative './spec_helper.rb'

RSpec.describe ARPScan do
  ARPScan('-l')
  it 'is a method' do
    expect(ARPScan.respond_to?('__send__')).to eq(true)
  end
end
