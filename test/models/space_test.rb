require "test_helper"

describe Space do
  let(:space) { Space.new }

  it "must be valid" do
    value(space).must_be :valid?
  end
end
