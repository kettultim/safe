require 'test_helper'

feature 'Admin changes user password' do
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

    fill_in 'Password', with: 'asdkflajsdklfjaskdlfjsd'
    click_button 'Update User'

    @user.reload
  end

  scenario 'it changes the password' do
    @user.encrypted_password.wont_equal @password
  end
end
