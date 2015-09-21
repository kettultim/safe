require 'test_helper'

feature 'Admin User Management' do
  let(:admin) { create(:admin) }

  before do
    login_as admin
    visit root_path
    click_link 'Users'
  end

  scenario 'it lists all users' do
    page.must_have_content(User.first.email)
  end
end
