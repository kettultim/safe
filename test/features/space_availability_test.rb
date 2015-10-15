require 'test_helper'

feature 'Space availability' do
  let(:space) { create(:space) }

  setup do
    login_as space.user
    visit root_path
    click_link 'Manage Your Listings'
    within ".space-#{space.id}" do
      click_link 'Manage Availability'
    end

    click_link 'Add Availability Range'

    select '2015', from: 'availability_start_date_1i'
    select 'July', from: 'availability_start_date_2i'
    select '10', from: 'availability_start_date_3i'

    select Date.today.year + 1, from: 'availability_end_date_1i'
    select 'August', from: 'availability_end_date_2i'
    select '29', from: 'availability_end_date_3i'

    click_button 'Add Range'

    space.reload

    @availability = space.availabilities.last
  end

  scenario 'it creates availability' do
    @availability.start_date.must_equal Date.new(2015, 7, 10)
    @availability.end_date.must_equal Date.new(Date.today.year + 1, 8, 29)
  end

  scenario 'it redirects to the availability listing' do
    current_path.must_equal space_availabilities_path(space)
  end

  scenario 'it displays the range' do
    page.must_have_content @availability.range
  end

  scenario 'it can be deleted' do
    within ".availability-#{@availability.id}" do
      click_link 'Delete'
    end

    current_path.must_equal space_availabilities_path(space)
    space.reload
    space.availabilities.wont_include @availability
  end
end
