require 'test_helper'

feature 'host profile update' do
  let(:user) { create(:host) }

  scenario 'user updates a profile' do
    login_as user
    visit root_path
    click_link 'Edit Profile'

    fill_in 'Name', with: 'Bob'
    fill_in 'About', with: 'blah'
    fill_in 'Twitter', with: 'handle'
    fill_in 'Phone', with: '555-555-5555'
    select 'United States', from: 'Country'
    attach_file 'Photo', test_image
    click_button 'Update Profile'


    current_path.must_equal edit_profile_path

    user.profile.reload
    user.profile.name.must_equal 'Bob'
    user.profile.country.must_equal 'US'
    user.profile.twitter.must_equal 'handle'
    user.profile.phone.must_equal '555-555-5555'
    user.profile.about.must_equal 'blah'
    user.profile.photo.exists?.must_equal true
  end
end
