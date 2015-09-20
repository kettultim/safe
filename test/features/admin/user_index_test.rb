require 'test_helper'

feature 'Admin User Management' do
  let(:admin) { create(:admin) }

  before do
    login_as admin

    visit admin_users_path
  end

  scenario 'it lists all users' do
    page.must_have_content User.first.email
  end
end
