require 'yaml'
require 'ostruct'

module BpxClient
  class Config

    attr_reader :bpx_config

    def initialize( filename = 'bpx_config.yml')
      @bpx_config = YAML::load_file("../config/#{filename}").transform_keys(&:to_sym)
    end

    def consumer_maintainance
      OpenStruct.new @bpx_config[:consumer_maintainance].transform_keys(&:to_sym)
    end

    def header
      OpenStruct.new @bpx_config[:header_fields].transform_keys(&:to_sym)
    end
  end
end
