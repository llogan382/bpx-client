require "bpx_client/version"

module BpxClient
  class Error < StandardError; end

  DefaultConfig = Struct.new(:endpoint_url, :payrailz_bpx_id) do
  end

  def initialize
    self.endpoint_url = 10
    self.payrailz_bpx_id = '123456789'
  end
end

def self.configure
  @config = DefaultConfig.new
  yield(@config) if block_given?
  @config
end

def self.config
  @config || configure
end

=begin
autoload :SoapClient, './bpx_client/soap_client'
autoload :BaseService, './bpx_client/base_service'

module Services
  autoload :ConsumerMaintenanceService, './bpx_client/services/consumer_maintenance_service'

  module ConsumerMaintenance
    autoload :RequestBuilder, './bpx_client/services/consumer_maintenance/request_builder'
    autoload :ResponseParser, './bpx_client/services/consumer_maintenance/response_parser'
  end
end
=end

