require 'test_helper'

feature 'Admin creates a user' do
  let(:admin) { create(:admin) }

  before do
    login_as admin
    visit root_path
    click_link 'Users'
    click_link 'New User'

    fill_in 'Email', with: 'blah@blah.com'
    fill_in 'Password', with: 'testing!!!'
    select 'Admin', from: 'Role'
    click_button 'Create User'

    @user = User.last
  end

  scenario 'it sets the email address' do
    @user.email.must_equal 'blah@blah.com'
  end

  scenario 'it sets the password' do
    @user.encrypted_password.to_s.wont_be :empty?
  end

  scenario 'it sets the role' do
    @user.role.must_equal 'admin'
  end

  scenario 'it redirects to the user index' do
    current_path.must_equal admin_users_path
  end
end
