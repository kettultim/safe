require "test_helper"

describe RequestMailer do
  let(:space) { create(:space) }
  let(:guest) { create(:guest) }
  let(:request) {
    create(:request, user: guest, space: space)
  }

  before do
    @mail = RequestMailer.notify_host(request.id)
    @mail.deliver_now
  end

  it 'emails the host' do
    @mail.to.must_include space.user.email
  end

  it 'includes the space name in the subject' do
    @mail.subject.must_include space.name
  end

  it 'includes the potential guest email' do
    @mail.body.must_include request.email
  end

  it 'includes the request message' do
    @mail.body.must_include request.message
  end
end
