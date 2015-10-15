require 'test_helper'

feature 'Space update' do
  let(:space) { create(:space) }

  setup do
    login_as space.user
    visit root_path
    click_link 'Manage Your Listings'

    within ".space-#{space.id}" do
      click_link 'Edit'
    end

    fill_in 'Name', with: 'New Name'
    select 'Canada', from: 'Country'
    fill_in 'Description', with: 'pfff'

    click_button 'Update Space'

    space.reload
  end

  scenario 'it updates the space' do
    space.name.must_equal 'New Name'
    space.country.must_equal 'CA'
    space.description.must_equal 'pfff'
  end

  scenario 'it redirects to the Manage Your Listings' do
    current_path.must_equal host_dashboard_path
  end
end
