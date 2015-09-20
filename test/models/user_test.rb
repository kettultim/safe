require "test_helper"

describe User do
  let(:user) { build(:admin) }

  it 'it has admin role' do
    user.must_be :admin?
  end
end
