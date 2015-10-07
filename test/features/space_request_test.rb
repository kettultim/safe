require 'test_helper'

feature 'Space request' do
  let(:space) { create(:space) }
  let(:user) { create(:guest) }

  setup do
    login_as user
    visit space_path space

    fill_in 'Email', with: user.email
    fill_in 'Message', with: 'blah'
    click_button 'Submit Request'

    @request = Request.last
  end

  scenario 'It creates the request' do
    @request.email.must_equal user.email
    @request.message.must_equal 'blah'
    @request.user.must_equal user
    @request.space.must_equal space
  end

  scenario 'It emails the host' do
    ActionMailer::Base.deliveries.wont_be_empty
  end

  scenario 'It redirects to the space' do
    current_path.must_equal space_path space
  end
end
