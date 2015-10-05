require 'test_helper'

feature 'Admin updates a user' do
  let(:admin) { create(:admin) }

  before do
    @user = create(:user)
    @password = @user.encrypted_password

    login_as admin
    visit root_path
    click_link 'Users'

    within ".user-#{@user.id}" do
      click_link 'Edit'
    end

    fill_in 'Email', with: 'blah@blah.com'
    select 'Host', from: 'Role'
    click_button 'Update User'

    @user.reload
  end

  scenario 'it updates the email address' do
    @user.email.must_equal 'blah@blah.com'
  end

  scenario 'it updates the role' do
    @user.role.must_equal 'host'
  end

  scenario 'it does not change the password' do
    @user.encrypted_password.must_equal @password
  end

  scenario 'it redirects to the user index' do
    current_path.must_equal admin_users_path
  end
end
