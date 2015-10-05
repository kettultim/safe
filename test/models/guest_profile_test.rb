require "test_helper"

describe GuestProfile do
  let(:guest_profile) { GuestProfile.new }

  it "must be valid" do
    value(guest_profile).must_be :valid?
  end
end
