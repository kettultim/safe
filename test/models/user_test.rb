require "test_helper"

describe User do
  let(:user) { build(:admin) }

  it 'it has admin role' do
    user.must_be :admin?
  end

  describe '.Roles' do
    specify { User.roles.must_include :admin }
    specify { User.roles.must_include :guest }
    specify { User.roles.must_include :host }
  end
end
