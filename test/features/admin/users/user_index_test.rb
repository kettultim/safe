require 'test_helper'

feature 'Admin User Management' do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }

  before do
    user

    login_as admin
    visit root_path
    click_link 'Users'
  end

  scenario 'it lists the email address' do
    within ".user-#{user.id}" do
      page.must_have_content(user.email)
    end
  end

  scenario 'it lists the role' do
    within ".user-#{user.id}" do
      page.must_have_content(user.role.titleize)
    end
  end
end
