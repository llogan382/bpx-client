require 'spec_helper'


RSpec.describe BpxClient::Services::BusinessApplicationHeader do
#describe Bpx::Client::Services::BusinessApplicationHeader do

  it "you must enter all params to create a BusinessApplicationHeader object" do
    empty = BpxClient::Services::BusinessApplicationHeader new

    expect(empty).not nill

  end


end