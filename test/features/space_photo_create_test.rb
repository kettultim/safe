require 'test_helper'

feature 'Space photo upload' do
  let(:space) { create(:space) }

  setup do
    login_as space.user
    visit root_path
    click_link 'Host Dashboard'

    within ".space-#{space.id}" do
      click_link 'Manage Photos'
    end

    click_link 'Add New Photo'

    attach_file 'Image', test_image
    click_button 'Upload'

    space.reload
  end

  scenario 'it creates the photo' do
    space.photos.last.image.exists?.must_equal true
  end

  scenario 'it redirects to the images page' do
    current_path.must_equal space_photos_path(space)
  end

  scenario 'it displays the photo' do
    page.body.must_include space.photos.last.url(:medium)
  end
end
