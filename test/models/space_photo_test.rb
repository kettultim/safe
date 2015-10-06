require "test_helper"

describe SpacePhoto do
  let(:space_photo) { SpacePhoto.new }

  it "must be valid" do
    value(space_photo).must_be :valid?
  end
end
