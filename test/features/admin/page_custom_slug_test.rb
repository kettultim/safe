require 'test_helper'

feature 'Admin Page Regenerate Slug' do
  let(:admin) { create(:admin) }

  before do
    @page = create(:page)

    login_as admin
    visit edit_admin_page_path(@page)

    fill_in 'Title', with: 'Foo Bar'
    fill_in 'Slug', with: 'flubber'

    click_button 'Update Page'

    @page.reload
  end

  scenario 'it changes the slug' do
    @page.friendly_id.must_equal 'flubber'
  end
end
