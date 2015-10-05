require "test_helper"

describe HostProfile do
  let(:host_profile) { HostProfile.new }

  it "must be valid" do
    value(host_profile).must_be :valid?
  end
end
