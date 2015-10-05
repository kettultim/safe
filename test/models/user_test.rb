require "test_helper"

describe User do
  should validate_presence_of :role

  context 'admin' do
    let(:admin) { create(:admin) }

    it 'it has admin role' do
      admin.must_be :admin?
    end
  end

  describe '.Roles' do
    specify { User.roles.must_include 'admin' }
    specify { User.roles.must_include 'guest' }
    specify { User.roles.must_include 'host' }
  end

  context 'guest' do
    let(:guest) { create(:guest) }

    it 'has a guest profile' do
      guest.profile.class.must_equal GuestProfile
    end
  end

  context 'guest' do
    let(:host) { create(:host) }

    it 'has a host profile' do
      host.profile.class.must_equal HostProfile
    end
  end
end
