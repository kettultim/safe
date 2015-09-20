require 'test_helper'

feature 'User Login' do
  let(:user) { create(:user) }

  background do
    login_as user
    visit root_path
  end

  scenario 'User logs into the application' do
    page.must_have_content user.email
  end
end
